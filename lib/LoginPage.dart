// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'SignupPage.dart';
//
// Color c1 = Colors.black;
// Color c2 = const Color(0xff08d9d6);
// Color c3 = const Color(0xffff2e63);
// Color c4 = Colors.white;
// Color c5 = const Color(0xff30e3ca);
// Color c6 = const Color(0xfff78888);
// Color c7 = const Color(0xfff3d250);
// Color c8 = const Color(0xffececec);
// Color c9 = const Color(0xff90ccf4);
// Color c10 = const Color(0xff5da2d5);
//
// class LoginPage extends StatefulWidget {
//   static const String id = 'loginpage';
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _key = GlobalKey<FormState>();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   bool loading = false;
//   bool isLoggedIn = false;
//   String _email, _password;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         title: new Text(
//           "Login",
//           style: TextStyle(color: c5),
//         ),
//         elevation: 0.2,
//       ),
//       body: Stack(
//         children: <Widget>[
//           Image.asset(
//             'car.jpg',
//             fit: BoxFit.fill,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           Container(
//             color: Colors.black.withOpacity(0.5),
//             width: double.infinity,
//             height: double.infinity,
//           ),
// //          Container(
// //            alignment: Alignment.topCenter,
// //            child: Image.asset(
// //              'images/lg.png',
// //              width: 240,
// //              height: 240,
// //            ),
// //          ),
//           Center(
//             child: Form(
//               key: _key,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Material(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.white.withOpacity(0.8),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: TextFormField(
//                           controller: _emailController,
//                           decoration: InputDecoration(
//
//                               icon: Icon(Icons.email),
//                               labelText: 'Email *',
//                               hintText: 'Enter e-mail'),
//                           keyboardType: TextInputType.emailAddress,
//                           validator: (value) {
//                             {
//                               Pattern pattern =
//                                   r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//                               RegExp regex = new RegExp(pattern);
//                               if (!regex.hasMatch(value))
//                                 return 'Please make sure your email address is valid';
//                               else
//                                 return null;
//                             }
//                           },
//                           onSaved: (input) => _email = input,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Material(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.white.withOpacity(0.8),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: TextFormField(
//                           obscureText: true,
//                           controller: _passwordController,
//                           decoration: InputDecoration(
//                               icon: Icon(Icons.lock_outline),
//                               labelText: 'Password *',
//                               hintText: 'Enter password'),
//                           validator: (value) {
//                             if (value == null) {
//                               return 'Password cannot be empty';
//                             }
//                             if (value.length < 6) {
//                               return 'Password length must be minimum 6-characters';
//                             }
//                             return null;
//                           },
//                           onSaved: (input) => _password = input,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Material(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.blue,
//                       child: MaterialButton(
//                         minWidth: MediaQuery.of(context).size.width,
//                         onPressed: () {
//                           //validateLogin();
//                         },
//                         child: Text(
//                           'Login',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
// //                  Divider(
// //                    color: Colors.white,
// //                  ),
//                   Text(
//                     'Forgot Password',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) {
//                             return SignUp();
//                           }));
//                     },
//                     child: Text(
//                       'Sign Up',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Visibility(
//               visible: loading ?? true,
//               child: Center(
//                 child: Container(
//                   alignment: Alignment.center,
//                   color: Colors.white.withOpacity(0.9),
//                   child: CircularProgressIndicator(
//                     valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//                   ),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
