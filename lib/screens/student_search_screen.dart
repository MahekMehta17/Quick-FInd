import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_find/utils/app_colors.dart';

import '../controller/student_controller.dart';
import '../utils/custom_textfield.dart';
import '../utils/routes.dart';

class StudentSearchPage extends StatelessWidget {
  final StudentController controller = Get.find();

  StudentSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Search'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.addStudentDetails)?.then(
              (value) => controller.getAllStudents(),
            ),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() {
              return CustomTextFields(
                leadingIcon: const Icon(Icons.search),
                onChange: (query) {
                  controller.searchStudents(query);
                  controller.searchString.value = query;
                },
                hintText: 'Search Student Name',
                textFieldController: controller.studentSearchTextBox,
                trailingIcon: controller.searchString.value == ''
                    ? null
                    : IconButton(
                        onPressed: () {
                          controller.searchString.value = '';
                          controller.studentSearchTextBox.text = '';
                          controller.getAllStudents();
                        },
                        icon: Icon(
                          Icons.cancel,
                          color: AppColors.primaryColor,
                        ),
                      ),
              );
            }),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (controller.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.error.isNotEmpty) {
                  return Center(child: Text(controller.error));
                } else if (controller.students.isEmpty) {
                  return const Center(child: Text('No students found.'));
                } else {
                  return ListView.builder(
                    itemCount: controller.students.length,
                    itemBuilder: (context, index) {
                      final student = controller.students[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColors.grey.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.all(8),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppColors.lightGreen,
                            child: Icon(
                              Icons.person,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                          trailing: CircleAvatar(
                            backgroundColor: AppColors.lightGrey,
                            radius: 18,
                            child: Text(
                              '${student['grade']}',
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ),
                          title: Text(student['name']),
                          subtitle: Text('ID: ${student['studentId']} |  Age: ${student['age']} '),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.history);
        },
        child: Icon(
          Icons.history,
          size: 30,
          color: AppColors.white,
        ),
      ),
    );
  }
}
