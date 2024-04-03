import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:todo_app/src/utils/helpers/taskHelper.dart';

import '../model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModel>? tasks = [];

  TodoProvider() {
    getTodos();
  }

  getTodos() async {
    tasks = await TaskHelper.instance.getTasks().then((value) {
      log("Tasks : $value");
      return null;
    }).onError((error, stackTrace) {
      log('error : $error');
      return null;
    });
    notifyListeners();
  }
}
