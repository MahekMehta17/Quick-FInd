import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../student_database.dart';

class StudentController extends GetxController {
  final RxBool _loading = false.obs;
  final RxString _error = ''.obs;
  final RxList<Map<String, dynamic>> _students = <Map<String, dynamic>>[].obs;
  final _recentSearches = <String>[].obs;
  final RxString searchString = ''.obs;

  final TextEditingController studentSearchTextBox = TextEditingController();
  final TextEditingController studentName = TextEditingController();
  final TextEditingController studentAge = TextEditingController();
  final TextEditingController studentId = TextEditingController();
  bool get isLoading => _loading.value;
  String get error => _error.value;
  List<Map<String, dynamic>> get students => _students.reversed.toList();
  List<String> get recentSearches => _recentSearches.reversed.toList();

  @override
  void onInit() {
    super.onInit();
    getAllStudents();
    loadRecentSearches();
  }

  var grade = 'A'.obs;

  List<String> gradeOptions = ['A', 'B', 'C', 'D'];

  getAllStudents() async {
    _loading.value = true;
    _error.value = '';

    try {
      _students.value = await StudentDatabase.instance.getStudents();
    } catch (e) {
      _error.value = 'Failed to load students';
    } finally {
      _loading.value = false;
    }
  }

  searchStudents(String query) async {
    _loading.value = true;
    _error.value = '';

    try {
      _students.value = await StudentDatabase.instance.searchStudents(query);
      if (_students.isNotEmpty) {
        addRecentSearch(query);
      }
    } catch (e) {
      _error.value = 'Failed to load students';
    } finally {
      _loading.value = false;
    }
  }

  addRecentSearch(String query) async {
    if (!_recentSearches.contains(query)) {
      _recentSearches.add(query);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('recent_searches', _recentSearches);
    }
  }

  insertStudent() async {
    final db = StudentDatabase.instance;
    await db.insertStudent(
      {
        'name': studentName.text,
        'age': studentAge.text,
        'studentId': studentId.text,
        'grade': grade.value,
      },
    );
    Get.back();
  }

  loadRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    _recentSearches.value = prefs.getStringList('recent_searches') ?? [];
  }

  deleteSearch(int index) async {
    _recentSearches.removeAt(index);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('recent_searches', _recentSearches);
  }
}
