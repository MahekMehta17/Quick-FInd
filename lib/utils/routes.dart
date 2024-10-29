import 'package:get/get.dart';
import 'package:quick_find/bindings/stud_binding.dart';
import 'package:quick_find/screens/search_history.dart';
import 'package:quick_find/screens/student_search_screen.dart';

import '../screens/add_student_details.dart';

class Routes {
  static const initRoute = '/';
  static const history = '/history';
  static const addStudentDetails = '/addStudentDetails';

  static List<GetPage> appRoutes = [
    GetPage(
      name: Routes.initRoute,
      page: () => StudentSearchPage(),
      binding: StudBinding(),
    ),
    GetPage(
      name: Routes.history,
      page: () => SearchHistory(),
    ),
    GetPage(
      name: Routes.addStudentDetails,
      page: () => AdStudentDetails(),
    ),
  ];
}
