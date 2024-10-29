import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_find/student_database.dart';
import 'package:quick_find/utils/app_theme.dart';
import 'package:quick_find/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dummyStudents = [
    {'name': 'John Doe', 'age': 20, 'studentId': 'S001', 'grade': 'A'},
    {'name': 'Jane Smith', 'age': 22, 'studentId': 'S002', 'grade': 'B'},
    {'name': 'Alice Johnson', 'age': 21, 'studentId': 'S003', 'grade': 'A'},
    {'name': 'Bob Williams', 'age': 23, 'studentId': 'S004', 'grade': 'C'},
    {'name': 'Chris Evans', 'age': 20, 'studentId': 'S005', 'grade': 'B'},
    {'name': 'Diana Prince', 'age': 22, 'studentId': 'S006', 'grade': 'A'},
    {'name': 'Eve Adams', 'age': 21, 'studentId': 'S007', 'grade': 'A'},
    {'name': 'Franklin Young', 'age': 23, 'studentId': 'S008', 'grade': 'B'},
    {'name': 'Grace Lee', 'age': 20, 'studentId': 'S009', 'grade': 'C'},
    {'name': 'Henry Morgan', 'age': 22, 'studentId': 'S010', 'grade': 'A'},
    {'name': 'Ivy Chen', 'age': 21, 'studentId': 'S011', 'grade': 'B'},
    {'name': 'Jack Ryan', 'age': 20, 'studentId': 'S012', 'grade': 'A'},
    {'name': 'Kara Zor-El', 'age': 23, 'studentId': 'S013', 'grade': 'B'},
    {'name': 'Liam Brown', 'age': 22, 'studentId': 'S014', 'grade': 'C'},
    {'name': 'Mia Davis', 'age': 21, 'studentId': 'S015', 'grade': 'A'},
    {'name': 'Nina Wilson', 'age': 20, 'studentId': 'S016', 'grade': 'B'},
    {'name': 'Oscar Green', 'age': 23, 'studentId': 'S017', 'grade': 'C'},
    {'name': 'Paula Thomas', 'age': 22, 'studentId': 'S018', 'grade': 'A'},
    {'name': 'Quincy Jones', 'age': 21, 'studentId': 'S019', 'grade': 'B'},
    {'name': 'Rachel Adams', 'age': 20, 'studentId': 'S020', 'grade': 'A'}
  ];

  final db = StudentDatabase.instance;
  for (var student in dummyStudents) {
    await db.insertStudent(student);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.themeData,
      initialRoute: Routes.initRoute,
      getPages: Routes.appRoutes,
    );
  }
}
