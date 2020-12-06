import 'package:car_service/FAQ.dart';
import 'package:car_service/Myorders.dart';
import 'package:car_service/Payments.dart';
import 'package:car_service/Profile.dart';
import 'package:car_service/vServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'LoginPage.dart';
import 'homePage.dart';

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

class DDrawer extends StatefulWidget {


  final FirebaseUser user;
  const DDrawer({Key key, this.user}) : super(key: key);

  @override
  _DDrawerState createState() => _DDrawerState();
}

class _DDrawerState extends State<DDrawer> {

  void customLaunch(command) async
  {
    if(await canLaunch(command))
    {
      await launch(command);
    }
  }
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e, st) {
      FlutterError.reportError(FlutterErrorDetails(exception: e, stack: st));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [c2, c10]),
              color: Colors.red,
            ),
            currentAccountPicture: GestureDetector(
                child: CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/474x/aa/b1/8f/aab18f3bd9edcb51fee7103dc49649b3.jpg'),
            )),
            accountName: Text(
              "Hello! ${ServiceApp.sharedPreferences.getString(ServiceApp.userName).split(" ")[0].toUpperCase()}",
              style: TextStyle(fontSize: 24),
            ),
            accountEmail: Text(
                ServiceApp.sharedPreferences.getString(ServiceApp.userEmail)),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: c2,
              ),
              title: Text('Home Page'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Profile();
              }));
            },
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: c2,
              ),
              title: Text('My Profile'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyOrders();
              }));
            },
            child: ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: c2,
              ),
              title: Text('My Bookings'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return Payments();
              }));
            },
            child: ListTile(
              leading: Icon(
                Icons.monetization_on,
                color: c2,
              ),
              title: Text('Payments'),
            ),
          ),
          // InkWell(
          //   onTap: () {
          //
          //   },
          //   child: ListTile(
          //     leading: Icon(
          //       Icons.message,
          //       color: c2,
          //     ),
          //     title: Text(
          //       'Terms & Conditions',
          //     ),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {},
          //   child: ListTile(
          //     leading: Icon(
          //       Icons.share,
          //       color: c2,
          //     ),
          //     title: Text('Share'),
          //   ),
          // ),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return Help();
              }));
            },
            child: ListTile(
              leading: Icon(
                Icons.feedback,
              ),
              title: Text('FAQ'),
            ),
          ),
          InkWell(
            onTap: () {
              customLaunch('tel: 09111884992');
            },
            child: ListTile(
              leading: Icon(
                Icons.call,
              ),
              title: Text('Contact us'),
            ),
          ),
          // InkWell(
          //   onTap: () {},
          //   child: ListTile(
          //     leading: Icon(
          //       Icons.help,
          //     ),
          //     title: Text('How we work'),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {},
          //   child: ListTile(
          //     leading: Icon(
          //       Icons.info,
          //     ),
          //     title: Text('About'),
          //   ),
          // ),
          InkWell(
            onTap: () {
              logout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return LoginPage();
              }));
            },
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
              ),
              title: Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
