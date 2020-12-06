import 'package:flutter/material.dart';
import '../vServices.dart';
import 'add_task.dart';
import 'tasklists.dart';
import 'task_data.dart';
import 'tasklists.dart';
import 'task.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  final int total;
  TasksScreen({this.total});
  @override
  _TasksScreenState createState() => _TasksScreenState();
}



class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskSheet(),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, bottom: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap:() async{
                    await ServiceApp.sharedPreferences
                        .setString(ServiceApp.total, '1196');
                    setState(() {
                      total=0;
                      Provider.of<TaskData>(context, listen: false).remAll();
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.refresh,
                      size: 40,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Cost Calculator',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).tasks.length} Services',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: TaskList(),
            ),
          ),
          // SizedBox(
          //   height: 60,
          // ),
          Container(
            height: 50,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' Total:   ',
                  style: TextStyle(
                      color: c4, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  '₹ $total',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
