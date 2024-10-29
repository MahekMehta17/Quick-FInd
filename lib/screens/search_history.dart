import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_find/utils/app_colors.dart';

import '../controller/student_controller.dart';

class SearchHistory extends StatelessWidget {
  SearchHistory({super.key});
  final StudentController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Searches'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => controller.recentSearches.isEmpty
              ? const Center(child: Text('No Recent Searches Found'))
              : ListView.builder(
                  itemCount: controller.recentSearches.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.recentSearches[index]),
                      onTap: () {
                        controller.studentSearchTextBox.text = controller.recentSearches[index];
                        controller.searchStudents(controller.recentSearches[index]);
                        controller.searchString.value = controller.recentSearches[index];
                        Get.back();
                      },
                      trailing: IconButton(
                        onPressed: () => controller.deleteSearch(index),
                        icon: Icon(
                          Icons.cancel,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
