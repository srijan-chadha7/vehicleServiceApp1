import 'dart:async';
import 'dart:ui';

import 'package:car_service/LoginPage.dart';
import 'package:car_service/homePage.dart';
import 'package:car_service/vServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginPage.dart';
import 'LoginPage.dart';
import 'LoginPage.dart';
import 'SignupPage.dart';
import 'SignupPage.dart';
import 'SignupPage.dart';

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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceApp.auth = FirebaseAuth.instance;
  ServiceApp.sharedPreferences = await SharedPreferences.getInstance();
  ServiceApp.firestore = Firestore.instance;
  bool isLoading = true;

  runApp(MaterialApp(
    theme: ThemeData.dark(),
    initialRoute: AfterSplash.id,
    routes: {
      SignUp.id: (context) => SignUp(),
      LoginPage.id: (context) => LoginPage(),
    },
    home: SplashScrn(),
    debugShowCheckedModeBanner: false,
  ));
}

class SplashScrn extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SplashScrn> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () async {
      if (await ServiceApp.auth.currentUser() != null) {
        print(ServiceApp.auth.currentUser());
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AfterSplash();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: c1),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                  'https://i.pinimg.com/474x/aa/b1/8f/aab18f3bd9edcb51fee7103dc49649b3.jpg'),
              SizedBox(
                height: 5,
              ),
              Text(
                'HandyGo',
                style: TextStyle(
                  color: c2,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Vocal For Local',
                style: TextStyle(
                  color: c5,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SpinKitFadingCube(
                duration: const Duration(milliseconds: 500),
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? c4 : c2,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AfterSplash extends StatefulWidget {
  static const String id = 'afterSplash';
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  List img = [
    Image.asset('assets/carmoving.gif'),
    Image.asset('assets/ez.gif'),
    Image.asset('assets/thirdintro.png')
  ];
  String textIntro(int i) {
    if (i == 0) {
      return 'Welcome to HandyGo Services';
    }
    if (i == 1) {
      return 'Vehicle Breakdown and stuck at roadside?';
    }
    return 'Vehicle needs repairs but cant leave home?';
  }

  String textLong(int i) {
    if (i == 0) {
      return 'We are the one click solution for all your vehicle related problem!';
    }
    if (i == 1) {
      return 'Dont worry!Our roadside assistance is there to help you out';
    }
    return 'Well guess what?You dont need to!Just book a doorstep service with us and we will send a technician right at your doorstep';
  }

  Color intro(int i) {
    if (i == 0) {
      return c7;
    }
    if (i == 1) {
      return c6;
    }
    return c5;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          backgroundColor: c1,
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
              'HandyGo',
              style: TextStyle(
                color: c4,
                fontSize: 20.0,
              ),
            ),
            centerTitle: true,
            backgroundColor: c1,
          ),
          body: PageView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: intro(index),
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton(
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => LoginPage()));
                            },
                            child: Text('SKIP',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: c1,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: img[index]),
                      Text(
                        textIntro(index),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: c1,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      Text(
                        textLong(index),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: c1,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      index == 2
                          ? Container(
                              width: 200,
                              decoration: BoxDecoration(
                                  color: c3,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                    child: Text(
                                      'Get Started',
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
                          : Container(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 10,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int i) {
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  width: index == i ? 40 : 20,
                                  color: index == i
                                      ? Colors.white70
                                      : Colors.white30,
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
