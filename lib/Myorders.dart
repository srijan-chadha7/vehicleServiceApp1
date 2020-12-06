import 'package:car_service/Reminder.dart';
import 'package:car_service/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:car_service/vServices.dart';


final _orderFireStore = Firestore.instance.collection("Orders");


class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}
Color c1 = Colors.white;
Color c2 = const Color(0xff08d9d6);
Color c3 = const Color(0xffff2e63);
Color c4 = Colors.white;
Color c5 = const Color(0xff30e3ca);
Color c6 = const Color(0xfff78888);
Color c7 = const Color(0xfff3d250);
Color c8 = const Color(0xffececec);
Color c9 = const Color(0xff90ccf4);
Color c10 = const Color(0xff5da2d5);
class _MyOrdersState extends State<MyOrders> {
  var dataToShow = [];
  var orderList = [];



  bool isInit = true;
  List args;
  void customLaunch(command) async
  {
    if(await canLaunch(command))
    {
      await launch(command);
    }
  }





  orderData() async {
    QuerySnapshot querySnapshot = await _orderFireStore.getDocuments();
    await ServiceApp.sharedPreferences
        .setString(ServiceApp.ordersTotal,querySnapshot.documents.length.toString());
    querySnapshot.documents.forEach((element) {
      //print(element.data['name']);
      if(element.data['name']==ServiceApp.sharedPreferences.getString(ServiceApp.userName))
        {
          orderList.add(element);
        }

    });
  }
  @override
  void initState() {
    super.initState();
  }



  @override
  void didChangeDependencies() async {
    if (isInit) {
      await orderData();

      // dataToShow = args.length > 0
      //     ? args[0] == UserType.Earner ? sharerList : earnerList
      //     : '';
      dataToShow = orderList;
      //Reminder(len: dataToShow.length);
      print(dataToShow.length);

      setState(() {});
      isInit = false;

    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: 600,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                    //reverse: true,
                    shrinkWrap: true,
                    itemCount: dataToShow.length,
                    itemBuilder: (context, index) {
                      return detailsContainer(
                        context,
                        dataToShow[index]["name"] ?? "",
                        dataToShow[index]["contact"] ?? "",
                        dataToShow[index]["emergencyService"] ?? "",
                        dataToShow[index]["vehicleType"] ?? "",
                        dataToShow[index]["registrationNumber"] ?? "",
                        dataToShow[index]["vehicleBrand"] ?? "",
                        dataToShow[index]["vehicleModel"] ?? "",
                        dataToShow[index]["serviceType"] ?? "",
                        dataToShow[index]["dateTime"] ?? "",
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Container detailsContainer(
      BuildContext context, name,contact,emergencyService,vehicleType,registrationNumber,vehicleBrand,vehicleModel,serviceType,dateTime) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery
          .of(context)
          .size
          .width,
      // height:MediaQuery
      //     .of(context)
      //     .size
      //     .height ,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 25.0, bottom: 25.0, right: 20.0, left: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                Text(
                  ''' ${ServiceApp.sharedPreferences.getString(ServiceApp.userName).split(" ")[0].toUpperCase()}'s Order Details ''',
                  style: TextStyle(
                      fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.person,
                  color:Colors.black,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 25.0,  right: 5.0, left: 5.0),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Type : $vehicleType',
                      style: TextStyle(fontSize: 20, color: c1,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // SizedBox(
                //   width: 30,
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 25.0, right: 5.0, left: 5.0),
            child: Row(
              children: <Widget>[
                Text(
                  '''Vehicle name :
$vehicleBrand $vehicleModel''',
                  style: TextStyle(fontSize: 20, color: c1,fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 25.0, right: 5.0, left: 5.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Vehicle Number : $registrationNumber',
                  style:TextStyle(fontSize: 20, color: c1,fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 25.0,  right: 5.0, left: 5.0),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      '''Emergency Services:
[ $emergencyService ]''',
                      style: TextStyle(fontSize: 20, color: c1,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 25.0,  right: 5.0, left: 5.0),
            child: Row(
              children: <Widget>[
                Text(
                  '''Service Type :
$serviceType''',
                  style: TextStyle(fontSize: 20, color: c1,fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 25.0, right: 5, left: 5.0),
            child: Row(
              children: <Widget>[
                Text(
                  '''Date/Time: 
$dateTime''',
                  style: TextStyle(fontSize: 20, color: c1,fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: c2
        // gradient: LinearGradient(
        //   colors: [c1, c2],
        // ),
      ),
    );
  }
}
