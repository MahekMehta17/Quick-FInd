import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class StudentDatabase {
  static final StudentDatabase instance = StudentDatabase._init();
  static Database? _database;

  StudentDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('students.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE students (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      age INTEGER NOT NULL,
      studentId TEXT NOT NULL,
      grade TEXT NOT NULL
    )
    ''');
  }

  Future<void> insertStudent(Map<String, dynamic> student) async {
    final db = await instance.database;
    await db.insert('students', student);
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    final db = await instance.database;
    return await db.query('students');
  }

  Future<List<Map<String, dynamic>>> searchStudents(String query) async {
    final db = await instance.database;
    return await db.query(
      'students',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
