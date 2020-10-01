import 'package:car_service/AnnualMS.dart';
import 'package:car_service/Cost.dart';
import 'package:car_service/Reminder.dart';
import 'package:car_service/genRepairs.dart';
import 'package:flutter/material.dart';

class HomeGrid extends StatefulWidget {
  @override
  _HomeGridState createState() => _HomeGridState();
}

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

class _HomeGridState extends State<HomeGrid> {
  List img = [
    'https://5.imimg.com/data5/LK/SX/MY-6254010/annual-maintenance-contract-service-500x500.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSLru1bWeH8vl4x3gswxWhpvMl28ExpjPaVwA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR0NpSV96kvoVuA-P3n5LcJ41ldLs02rf90EA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTLPaNSTo8pScQ388ZeIsCa8sRVRJuyghSYdg&usqp=CAU'
  ];
  var text = [
    Text(
      '''Annual Maintenance Contract''',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
    ),
    Text(
      '''Cost
  Estimation''',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
    ),
    Text(
      '''Service
   Reminders''',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
    ),
    Text(
      '''General
 Repairs''',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
    ),
  ];
  void nav(int i) {
    if (i == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AMS()));
    }
    if (i == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Cost()));
    }
    if (i == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Reminder()));
    }
    if (i == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GeneralRepairs()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          splashColor: Colors.black,
          // focusColor: Colors.black,
          // highlightColor: Colors.black,
          // hoverColor: Colors.black,
          onTap: () {
            nav(index);
          },
          child: Card(
            color: Colors.teal,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.network(
                  img[index],
                  height: 50,
                  width: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                text[index]
              ],
            ),
          ),
        );
      },
    );
  }
}
