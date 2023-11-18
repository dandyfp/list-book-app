import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    _instance ??= DatabaseHelper._internal();
    return _instance!;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'book_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE book(
        id INTEGER PRIMARY KEY,
        bookCode TEXT,
        bookTitle TEXT,
        publisherYear TEXT,
        publishName TEXT,
        authorName TEXT
      )
    ''');
  }

  Future<int> insertBook(Map<String, dynamic> book) async {
    Database db = await database;
    return await db.insert('book', book);
  }

  Future<List<Map<String, dynamic>>> getBukuList() async {
    Database db = await database;
    return await db.query('book', orderBy: 'publisherYear DESC');
  }
}
