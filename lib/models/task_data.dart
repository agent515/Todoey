import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {

  List<Task> _tasksList = [
//    Task(name : 'Buy milk'),
//    Task(name : 'Buy eggs'),
//    Task(name : 'Buy bread'),
  ];

  int get taskCount => _tasksList.length;

  UnmodifiableListView get taskslist {
    return UnmodifiableListView(_tasksList);
  }

  void addTasks(String newTaskTitle) {
    Task task = Task(name : newTaskTitle);
    _tasksList.add(task);
    notifyListeners();
  }

  void toggleDone(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasksList.remove(task);
    notifyListeners();
  }

}