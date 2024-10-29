import 'package:get/get.dart';
import 'package:quick_find/controller/student_controller.dart';

class StudBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentController());
  }
}
