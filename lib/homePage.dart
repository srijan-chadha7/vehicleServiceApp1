import 'package:car_service/AnnualMS.dart';
import 'package:car_service/Homie.dart';
import 'package:car_service/LoginPage.dart';
import 'package:car_service/Mybookings.dart';
import 'package:car_service/drawer.dart';
import 'package:car_service/vServices.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'ChatBot.dart';

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
Color c11 = Color(0xFFF0F0F0);

class HomePage extends StatefulWidget {
  final FirebaseUser user;
  const HomePage({Key key, this.user}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit the App'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("NO"),
          ),
          SizedBox(height: 16),
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(true),
            child: Text("YES"),
          ),
        ],
      ),
    ) ??
        false;
  }
  var currentIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(

            // bottomNavigationBar: BottomNavigationBar(
            //   backgroundColor: Colors.white,
            //   unselectedItemColor: Colors.black,
            //   selectedItemColor: c2,
            //   type: BottomNavigationBarType.fixed,
            //   items: [
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.home),
            //       title: Text("Home"),
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.book),
            //       title: Text("Bookings"),
            //     ),
            //   ],
            //   onTap: (index) {
            //     setState(() {
            //       currentIndex = index;
            //     });
            //   },
            // ),
            backgroundColor: c4,
            appBar: AppBar(
              elevation: 0.3,
              backgroundColor: c2,
              title: Text('HandyGo'),
              // actions: <Widget>[
              //   // IconButton(
              //   //     icon: Icon(
              //   //       Icons.search,
              //   //       color: Colors.white,
              //   //     ),
              //   //     onPressed: () {}),
              //   // IconButton(
              //   //     icon: Icon(
              //   //       Icons.shopping_cart,
              //   //       color: Colors.white,
              //   //     ),
              //   //     onPressed: () {
              //   //       // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   //       //   return Cart();
              //   //       // }));
              //   //     }
              //   //     ),
              // ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: c2,
              foregroundColor: c1,
              elevation: 10.0,
              child: Icon(Icons.question_answer),
              onPressed: (){
                Navigator.pushNamed(context, ChatBot.id);
              },
            ),
            drawer: DDrawer(),
            body: Homie()),
      ),
    );
  }

  // getBodyWidget() {
  //   return (currentIndex == 0) ? Homie() : Bookings();
  // }
}
