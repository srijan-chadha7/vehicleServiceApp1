import 'package:car_service/drawer.dart';
import 'package:car_service/vServices.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  Profile({this.name, this.email, this.dob, this.phone});
  final String name;
  final String email;
  final String dob;
  final String phone;

  static const String id = 'Profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ImagePicker picker = ImagePicker();
  PickedFile image;
  List details = [
    'Phone Number',
    'Date of Birth',
    'Trips Completed',
    'Upcoming Trip'
  ];
  // List customerDetails = [
  //   '8989898989',
  //   '26th April 2020',
  //   '50',
  //   'Delhi-Mumbai'
  // ];
  List<double> fontSize = [20.0, 20.0, 40.0, 20.0];

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
  // String name1() {
  //   if (widget.name == null) {
  //     String nm = 'Pulkit Agarwal';
  //     return nm;
  //   }
  //   return widget.name;
  // }
  //
  // String email1() {
  //   if (widget.email == null) {
  //     String nm = 'pulkitagarwal2899@gmail.com';
  //     return nm;
  //   }
  //   return widget.email;
  // }
  //
  // String dob1() {
  //   if (widget.dob == null) {
  //     String nm = '26th April 2020';
  //     return nm;
  //   }
  //   return widget.dob;
  // }
  //
  // String phone1() {
  //   if (widget.phone == null) {
  //     String nm = '8989898989';
  //     return nm;
  //   }
  //   return widget.phone;
  // }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            'Choose Profile Photo',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera),
                  label: Text('Camera')),
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image),
                  label: Text('Gallery')),
              FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      image = null;
                    });
                  },
                  icon: Icon(Icons.clear),
                  label: Text('Remove'))
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          backgroundColor: Colors.white,
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: c3,
          //   foregroundColor: c2,
          //   elevation: 10.0,
          //   child: Icon(Icons.question_answer),
          //   onPressed: () {
          //     Navigator.pushNamed(context, Contact.id);
          //   },
          // ),

          appBar: AppBar(
            iconTheme: IconThemeData(
              color: c4,
            ),
            title: Text('My Profile'),
            elevation: 0.1,
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
          body: Stack(
            children: [
              Container(
                decoration:
                    BoxDecoration(gradient: LinearGradient(colors: [c10, c4])),
              ),
              Padding(
                padding: EdgeInsets.only(top: 65.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: c2, width: 2.0)),
                              child: CircleAvatar(
                                backgroundImage: image == null
                                    ? NetworkImage(
                                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png')
                                    : image,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 20,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      backgroundColor: c2,
                                      context: context,
                                      builder: ((builder) => bottomSheet()));
                                },
                                child: Icon(Icons.camera_alt,
                                    size: 20, color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      ServiceApp.sharedPreferences
                          .getString(ServiceApp.userName)
                          .toUpperCase(),
                      style: TextStyle(
                          color: c4, fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                    // SizedBox(
                    //   height: 8.0,
                    // ),
                    // Text(
                    //   ServiceApp.sharedPreferences.getString(ServiceApp.userEmail),
                    //   style: TextStyle(
                    //       color: Colors.white54,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 18),
                    // ),
                    // SizedBox(
                    //   height: 10.0,
                    // ),
                    // MaterialButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, EditProfile.id);
                    //   },
                    //   elevation: 5.0,
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(30)),
                    //   color: c2,
                    //   child: Text(
                    //     'Edit Profile',
                    //     style: TextStyle(
                    //       color: c4,
                    //       fontWeight: FontWeight.bold,
                    //       //fontSize: 18),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 250),
                decoration: BoxDecoration(
                    color: c4,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: ListView(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 5,
                        color: c4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 21.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.calendar_today,
                                  size: 40.0,
                                  color: c2,
                                ),
                              ),
                              SizedBox(width: 24.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.grey),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    ServiceApp.sharedPreferences
                                        .getString(ServiceApp.userEmail),
                                    style: TextStyle(fontSize: 18.0, color: c1),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 5,
                        color: c4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 21.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.phone,
                                  size: 40.0,
                                  color: c2,
                                ),
                              ),
                              SizedBox(width: 24.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    "Phone Number",
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.grey),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    ServiceApp.sharedPreferences
                                        .getString(ServiceApp.userPhone),
                                    style: TextStyle(fontSize: 18.0, color: c1),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 5,
                        color: c4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 21.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.check,
                                  size: 40.0,
                                  color: c2,
                                ),
                              ),
                              SizedBox(width: 24.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    "Orders Completed",
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.grey),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    "50",
                                    style: TextStyle(fontSize: 18.0, color: c1),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 5,
                        color: c4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 21.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.settings,
                                  size: 40.0,
                                  color: c2,
                                ),
                              ),
                              SizedBox(width: 24.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    "Upcoming Service",
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.grey),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    "Car-Washing",
                                    style: TextStyle(fontSize: 18.0, color: c1),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
//              Container(
//                margin: EdgeInsets.only(top: 300),
//                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.only(
//                  topLeft: Radius.circular(20),
//                  topRight: Radius.circular(20),
//                )),
//                child: Padding(
//                  padding: EdgeInsets.all(16),
//                  child: GridView.builder(
//                    itemCount: 4,
//                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                      crossAxisCount: 2,
//                    ),
//                    itemBuilder: (context, index) => Container(
//                      decoration: BoxDecoration(
//                        gradient: LinearGradient(
//                            colors: [Color(0xff393e46), Color(0xff4ecca3)]),
//                        color: c3,
//                        borderRadius: BorderRadius.circular(20),
//                      ),
//                      margin: EdgeInsets.all(4),
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: [
//                          Text(
//                            details[index],
//                            style: TextStyle(
//                                fontSize: 16,
//                                color: c2,
//                                fontWeight: FontWeight.bold),
//                          ),
//                          SizedBox(
//                            height: 40,
//                          ),
//                          Padding(
//                            padding: const EdgeInsets.only(left: 8.0),
//                            child: Container(
//                              child: Text(
//                                customerDetails[index],
//                                style: TextStyle(
//                                    fontSize: fontSize[index],
//                                    fontWeight: FontWeight.bold,
//                                    color: c4),
//                              ),
//                            ),
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
