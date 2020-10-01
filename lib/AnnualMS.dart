import 'package:flutter/material.dart';

import 'drawer.dart';

class AMS extends StatefulWidget {
  @override
  _AMSState createState() => _AMSState();
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
Color c11 = Color(0xFFF0F0F0);

class _AMSState extends State<AMS> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: c4,
        appBar: AppBar(
          elevation: 0.3,
          backgroundColor: c2,
          title: Text('HandyGo'),
        ),
        drawer: DDrawer(),
        body: SafeArea(
          child: Container(
            color: c4,
            child: ListView(
              children: <Widget>[
                Image.asset(
                  'img1.jpeg',
                  height: 100,
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Annual Maintenance Contract:',
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
                          child: Text(
                            '''
The one with Extra luggage willing to share their luggage.
                                
Enter your trip and luggage details

Select an Earner to share luggage with.

Confirm, Pay ,Exchange, Travel

Repeat.''',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              wordSpacing: 2.0,
                              color: c4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [c9, c10])),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                Image.asset(
                  'amc.jpg',
                  height: 200,
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      color: c7, borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             LoginPage()));
                        },
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: c1),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: c1,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
