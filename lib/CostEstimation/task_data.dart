import 'package:flutter/cupertino.dart';
import 'task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Oil Change'),
    Task(name: 'Puncture'),
    Task(name: 'AC Repair'),
    Task(name: 'Breakdown')

  ];
  void remAll()
  {
    tasks.clear();
    notifyListeners();
  }

  void addTask(String newTaskText) {
    final task = Task(name: newTaskText);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
