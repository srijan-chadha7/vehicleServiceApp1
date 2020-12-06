import 'package:car_service/CostEstimation/taskScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task.dart';
import 'task_data.dart';
import 'package:car_service/VehiclesList.dart';

String taskText = '';
Color c1 = Colors.black;
Color c2 = const Color(0xff08d9d6);
Color c3 = const Color(0xffff2e63);
Color c4 = Colors.white;
Color c5 = const Color(0xff30e3ca);
Color c6 = const Color(0xfff78888);
Color c7 = const Color(0xfff3d250);
Color c8 = const Color(0xffececec);
Color c9 = const Color(0xff90ccf4);
Color c10 = const Color(0xff5da2d5);
String selectedMake='Puncture';
class AddTaskSheet extends StatefulWidget {
  @override
  _AddTaskSheetState createState() => _AddTaskSheetState();
}
int total=1196;

class _AddTaskSheetState extends State<AddTaskSheet> {
  DropdownButton<String> androidDropdown1() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    List gaadi=services;
    for (String service in gaadi) {
      var newItem = DropdownMenuItem(
        child: Text(service,
          style: TextStyle(
              color: c1
          ),),
        value: service,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(

      icon: Icon(Icons.arrow_drop_down,color: Colors.black,),

      dropdownColor: Colors.white,
      elevation: 8,
      value: selectedMake,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedMake = value;

        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Service',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(child: androidDropdown1()),


            SizedBox(
              height: 10,
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              child: Text(
                'ADD',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(selectedMake);
                Navigator.pop(context);
                setState(() {
                  total=total+services1[selectedMake];
                });
                TasksScreen(total: total);
              },
            ),
          ],
        ),
      ),
    );
  }
}
