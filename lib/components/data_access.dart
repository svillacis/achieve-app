import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:achieve/components/todo.dart';

final String todoTable = "TodoItems";

class DataAccess {
  static final DataAccess _instance = DataAccess._internal();
  Database _db;

  factory DataAccess() {
    return _instance;
  }

  Future open() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + "\todo.db";

    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
            create table $todoTable ( 
            id integer primary key autoincrement, 
            name text not null,
            isComplete integer not null)
            ''');
    });

    // This is just a convenience block to populate the database if it's empty.
    // We likely wouldn't use this in a real application
  }

  Future<List<TodoItem>> getTodoItems() async {
    var data = await _db.query(todoTable);
    return data.map((d) => TodoItem.fromMap(d)).toList();
  }

  Future insertTodo(TodoItem item) {
    return _db.insert(todoTable, item.toMap());
  }

  Future updateTodo(TodoItem item) {
    return _db
        .update(todoTable, item.toMap(), where: "id = ?", whereArgs: [item.id]);
  }

  Future deleteTodo(TodoItem item) {
    return _db.delete(todoTable, where: "id = ?", whereArgs: [item.id]);
  }

  DataAccess._internal();
}
