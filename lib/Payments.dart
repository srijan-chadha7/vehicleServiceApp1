import 'package:flutter/material.dart';

import 'drawer.dart';

class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
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
class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c4,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xffeeeeee),
        ),
        title: Text('My Orders'),
        elevation: 0.5,
        backgroundColor: c2,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          title: TextStyle(
            color: c4,
            fontSize: 20,
          ),
        ),
      ),
        drawer: DDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: Text(

                  '  Take a Screenshot and scan via any payment platform!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: c5,
                    fontSize: 24
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Scan And Pay!',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: c4,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: Image.asset('assets/pay.jpg',fit: BoxFit.fill,)
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [c9, c10])),
            ),
          ],
        ),
      ),

    );
  }
}
