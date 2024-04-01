import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

mixin taskApproaches {
  void initDB();

  void insertTask({required String text});

  void deleteTask({required int index});

  void updateTask({required int index, required String newText});
}

class TaskHelper with taskApproaches {
  TaskHelper._();

  static final TaskHelper instance = TaskHelper._();

  String tableName = "TASKS";

  String tableIndex = "index";

  String tableText = "userTask";

  Database? database;

  @override
  Future<void> initDB() async {
    String location = await getDatabasesPath();

    String path = join(location, "tasks.db");

    database = await openDatabase(path, version: 1, onCreate: (database, _) {
      String query =
          "CREATE TABLE $tableName ($tableIndex INTEGER PRIMARY KEY AUTOINCREMENT,$tableText TEXT NOT NULL)";

      database.execute(query);
    });
  }

  @override
  void insertTask({required String text}) {}

  @override
  void deleteTask({required int index}) {
    // TODO: implement deleteTask
  }

  @override
  void updateTask({required int index, required String newText}) {
    // TODO: implement updateTask
  }
}
