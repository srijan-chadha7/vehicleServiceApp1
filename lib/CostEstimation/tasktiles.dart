import 'package:flutter/material.dart';
import 'package:car_service/VehiclesList.dart';
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
class TaskTiles extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallBack;
  final Function longPress;
  TaskTiles(
      {this.isChecked, this.taskTitle, this.checkBoxCallBack, this.longPress});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
              border: Border.all(color: c1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ListTile(
                onLongPress: longPress,
                title: Text(
                  taskTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold

                  ),

                ),
                trailing: Text(
                  '₹ ${services1[taskTitle].toString()}',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold

                  ),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
