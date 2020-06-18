import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(itemBuilder: (context, index){
          final task = taskData.taskslist[index];
          return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState){
                Provider.of<TaskData>(context, listen: false).toggleDone(task);
              },
              longPressCallback: (){
                Provider.of<TaskData>(context, listen: false).deleteTask(task);
              }
          );
        },
          itemCount: taskData.taskCount,
        );
      }
    );
  }
}
