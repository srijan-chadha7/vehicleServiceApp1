import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task.dart';
import 'tasktiles.dart';
import 'task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTiles(
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkBoxCallBack: (checkBoxState) {
                  taskData.updateTask(taskData.tasks[index]);
                },
                longPress: () {
                  taskData.deleteTask(taskData.tasks[index]);
                });
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}
