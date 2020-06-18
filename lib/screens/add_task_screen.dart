import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class AddTaskScreen extends StatefulWidget {

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTaskTitle;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight : Radius.circular(30.0)
          )
        ),
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style : TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color : Colors.lightBlueAccent,
                ),
              ),
              TextField(
                controller: controller,
                textAlign: TextAlign.center,
                autofocus: true,
                onChanged: (value) {
                  newTaskTitle = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top : 20.0),
                child: SizedBox(
                  height: 45.0,
                  child: FlatButton(
                    color: Colors.lightBlueAccent,
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                      ),
                    ),
                    onPressed: () {
                      //add task to the task list
                      Provider.of<TaskData>(context, listen: false).addTasks(newTaskTitle);
                      controller.clear();
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
