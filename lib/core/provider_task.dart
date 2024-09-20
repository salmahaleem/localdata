import 'package:flutter/cupertino.dart';

import 'local_data.dart';

class TaskProvider extends ChangeNotifier{

  List<Map<String, dynamic>> _tasks = [];

  List<Map<String, dynamic>> get tasks => _tasks;

  Future<void>loadTask()async{
    _tasks = await getDataBase();
    notifyListeners();
  }

  Future<void>addTask(String title, String dis, String time, String date)async{
    await insertDataBase(
      title: title,
      dis :dis,
      time: time,
      date: date
    );
    await loadTask();
  }

  Future<void>deleteTask(int id)async{
    await deleteDataBase(id);
    await loadTask();
  }

  Future<void>deleteAllTask()async{
    await deleteAllTask();
    _tasks.clear();
    notifyListeners();
  }
}