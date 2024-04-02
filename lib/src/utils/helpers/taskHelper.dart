import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/src/views/home/model/todo_model.dart';

mixin taskApproaches {
  Future<void> initDB();

  Future<int?> insertTask({required String text});

  void getTasks();

  void deleteTask({required int index});

  void updateTask({required int index, required String newText});
}

class TaskHelper with taskApproaches {
  TaskHelper._();

  static final TaskHelper instance = TaskHelper._();

  String tableName = "TASKS";

  String tableId = "id";

  String tableText = "text";

  Database? database;

  @override
  Future<void> initDB() async {
    String location = await getDatabasesPath();

    String path = join(location, "tasks.db");

    database = await openDatabase(path, version: 1, onCreate: (db, _) {
      String query =
          "CREATE TABLE $tableName($tableId INTEGER PRIMARY KEY AUTOINCREMENT, $tableText TEXT NOT NULL);";

      db.execute(query).then((value) {
        log("$tableName table Created Successfully ");
      }).onError((error, _) {
        log("ERROR : $error");
      });
    });
  }

  @override
  Future<int?> insertTask({required String text}) async {
    await initDB();
    return await database?.insert(tableName, {
      tableText: text,
    });
  }

  @override
  Future<List<TodoModel>?> getTasks() async {
    await initDB();

    String query = "SELECT * FROM $tableName";
    List<Map<String, Object?>>? data = await database?.rawQuery(query);

    return data
        ?.map(
          (e) => TodoModel.fromTable(data: e),
        )
        .toList();
  }

  @override
  deleteTask({required int index}) {}

  @override
  void updateTask({required int index, required String newText}) {
    // TODO: implement updateTask
  }
}
