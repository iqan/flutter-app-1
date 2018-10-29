import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app1/model/todo.dart';

class Data {
  String tableTodo = "todo";
  String columnId = "id";
  String columnTitle = "title";
  String columnDescription = "description";
  String columnPriority = "priority";
  String columnDate = "date";

  static final Data _data = new Data._internal();

  Data._internal();

  factory Data() {
    return _data;
  }

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "todos.db";
    var dbTodos = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbTodos;
  }
      
  void _createDb(Database db, int version) async {
    String createTableQuery = "CREATE TABLE $tableTodo($columnId INTEGER PRIMARY KEY," + 
      "$columnTitle TEXT, $columnDescription TEXT, $columnPriority INTEGER, $columnDate TEXT)";
    await db.execute(createTableQuery);
  }

  Future<int> insertTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.insert(tableTodo, todo.toMap());
    return result;
  }

  Future<List> getTodos() async {
    Database db = await this.db;
    var result = await db.query(tableTodo, orderBy: columnPriority);
    return result;
  }
  
  Future<int> getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
      await db.execute('SELECT COUNT(*) FROM $tableTodo')
    );
    return result;
  }

  Future<int> updateTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.update(tableTodo, todo.toMap(), where: columnId, whereArgs: [todo.id]);
    return result;
  }

  
  Future<int> deleteTodo(int id) async {
    Database db = await this.db;
    var result = await db.delete(tableTodo, where: columnId, whereArgs: [id]);
    return result;
  }
}