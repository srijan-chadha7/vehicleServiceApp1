import 'package:car_service/admin.dart';
import 'package:car_service/vServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SignupPage.dart';
import 'adminLogin.dart';
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

class AdminPage extends StatefulWidget {
  static const String id = 'loginpage';
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _key = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool loading = false;
  bool isLoggedIn = false;
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: new Text(
          "Login",
          style: TextStyle(color: c5),
        ),
        elevation: 0.2,
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            'car.jpg',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
          ),
//          Container(
//            alignment: Alignment.topCenter,
//            child: Image.asset(
//              'images/lg.png',
//              width: 240,
//              height: 240,
//            ),
//          ),
          Center(
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.8),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              icon: Icon(Icons.email),
                              labelText: 'Email *',
                              hintText: 'Enter e-mail'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(value))
                                return 'Please make sure your email address is valid';
                              else
                                return null;
                            }
                          },
                          onSaved: (input) => _email = input,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.8),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock_outline),
                              labelText: 'Password *',
                              hintText: 'Enter password'),
                          validator: (value) {
                            if (value == null) {
                              return 'Password cannot be empty';
                            }
                            if (value.length < 6) {
                              return 'Password length must be minimum 6-characters';
                            }
                            return null;
                          },
                          onSaved: (input) => _password = input,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () {
                          _emailController.text.isNotEmpty &&
                                  _passwordController.text.isNotEmpty
                              ? loginUser()
                              : showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Fields cannot be blank..'),
                                    );
                                  });
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
//                  Divider(
//                    color: Colors.white,
//                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) {
                  //           return AdminLoginPage();
                  //         }));
                  //   },
                  //   child: Text(
                  //     'I am an Admin',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //         color: Colors.blue,
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text(
                  //   'Forgot Password',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) {
                  //           return SignUp();
                  //         }));
                  //   },
                  //   child: Text(
                  //     'Sign Up',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //         color: Colors.blue,
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          Visibility(
              visible: loading ?? true,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.9),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  void loginUser() async {
    showDialog(
        context: context,
        builder: (c) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'Loging in....',
              style: TextStyle(color: Colors.black),
            ),
          );
        });

    FirebaseUser user;
    await auth
        .signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim())
        .then((auth) {
      user = auth.user;
    }).catchError((error) {
      print(error);
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error signing in'),
            );
          });
    });
    if (user != null) {
      readData(user).then((value) {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Admin();
        }));
        loading = false;
      });
    }
  }

  Future readData(FirebaseUser user) async {
    Firestore.instance
        .collection("users")
        .document(user.uid)
        .get()
        .then((dataSnapshot) async {
      await ServiceApp.sharedPreferences
          .setString("uid", dataSnapshot.data[ServiceApp.userUID]);
      await ServiceApp.sharedPreferences.setString(
          ServiceApp.userEmail, dataSnapshot.data[ServiceApp.userEmail]);
      await ServiceApp.sharedPreferences.setString(
          ServiceApp.userName, dataSnapshot.data[ServiceApp.userName]);
      await ServiceApp.sharedPreferences.setString(ServiceApp.userPhone,
          dataSnapshot.data[ServiceApp.userPhone].toString());
      List<String> cartList =
          dataSnapshot.data[ServiceApp.userCartList].cast<String>();
      await ServiceApp.sharedPreferences
          .setStringList(ServiceApp.userCartList, cartList);
    });
  }
}
