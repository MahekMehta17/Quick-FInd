import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/student_controller.dart';
import '../utils/custom_textfield.dart';

class AdStudentDetails extends StatelessWidget {
  final StudentController controller = Get.find();
  final _formKey = GlobalKey<FormState>();

  AdStudentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        controller.studentName.text = '';
        controller.studentAge.text = '';
        controller.studentId.text = '';
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Student Detail'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFields(
                  hintText: 'Name',
                  validator: (userInput) => ValidationsFunction.textValidation(userInput ?? '', 'Name'),
                  textFieldController: controller.studentName,
                ),
                CustomTextFields(
                  hintText: 'Age',
                  textInputType: TextInputType.number,
                  validator: (userInput) => ValidationsFunction.textValidation(userInput ?? '', 'Age'),
                  textFieldController: controller.studentAge,
                ),
                CustomTextFields(
                  hintText: 'ID',
                  validator: (userInput) => ValidationsFunction.textValidation(userInput ?? '', 'ID'),
                  textFieldController: controller.studentId,
                ),
                Obx(
                  () => DropdownButtonFormField<String>(
                    value: controller.grade.value.isEmpty ? null : controller.grade.value,
                    decoration: const InputDecoration(hintText: 'Grade'),
                    items: controller.gradeOptions.map((grade) {
                      return DropdownMenuItem(
                        value: grade,
                        child: Text(grade),
                      );
                    }).toList(),
                    onChanged: (value) => controller.grade.value = value!,
                    validator: (userInput) => ValidationsFunction.textValidation(userInput ?? '', 'Grade'),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.insertStudent();
                      }
                    },
                    child: const Text('Add'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ValidationsFunction {
  static String? textValidation(String userInput, String field) {
    userInput = userInput.trim();
    if (userInput != '' || userInput.isNotEmpty) {
      return (null);
    } else {
      return ("$field can not be empty");
    }
  }
}
