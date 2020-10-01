import 'package:car_service/Profile.dart';
import 'package:car_service/vServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
              "Hello! ${ServiceApp.sharedPreferences.getString(ServiceApp.userName).toUpperCase()}",
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
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.shopping_basket,
                color: c2,
              ),
              title: Text('My Bookings'),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.monetization_on,
                color: c2,
              ),
              title: Text('Payments'),
            ),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return Cart();
              // }));
            },
            child: ListTile(
              leading: Icon(
                Icons.message,
                color: c2,
              ),
              title: Text(
                'Terms & Conditions',
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.share,
                color: c2,
              ),
              title: Text('Share'),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.feedback,
              ),
              title: Text('FAQ'),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.help,
              ),
              title: Text('How we work'),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.info,
              ),
              title: Text('About'),
            ),
          ),
          InkWell(
            onTap: () {
              logout();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
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
