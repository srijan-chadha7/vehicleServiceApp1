import 'package:car_service/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'drawer.dart';
import 'package:car_service/Myorders.dart';
import 'vServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final _orderFireStore = Firestore.instance.collection("Orders");


class CalenderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Reminder(),
      theme: ThemeData.dark(),


    );
  }
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

class Reminder extends StatefulWidget {
  final int len;
  Reminder({this.len});
  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  var orderList = [];
  var dataToShow = [];
  bool isInit = true;
  List args;

  FlutterLocalNotificationsPlugin fltrNotif;



  orderData() async {
    QuerySnapshot querySnapshot = await _orderFireStore.getDocuments();
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
    // TODO: implement initState
    super.initState();
    _calenderController=CalendarController();
    var androidInitialize=AndroidInitializationSettings('logo2');
    var iOSinit=IOSInitializationSettings();
    var initializationSettings=InitializationSettings(androidInitialize,iOSinit);
    fltrNotif=FlutterLocalNotificationsPlugin();
    fltrNotif.initialize(initializationSettings,onSelectNotification: notifSelected);

  }

  Future _showNotifications() async
  {
    var androidDetails=AndroidNotificationDetails('Channel ID','HandyGo','Your vehicle service is due!!',
    importance: Importance.Max);
    var iosDetails=IOSNotificationDetails();
    var generalNotificationDetails=NotificationDetails(androidDetails, iosDetails);

    await fltrNotif.show(0, 'HandyGo', 'Reminder Set', generalNotificationDetails,payload: "set");



    var scheduleTime=DateTime.now().add(Duration(seconds:5));


    fltrNotif.schedule(1, 'Service Reminder', 'Your service is due', scheduleTime, generalNotificationDetails,payload: 'done');

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
      //print(dataToShow.length);
      setState(() {});
      isInit = false;

    }

    super.didChangeDependencies();
  }

  void customLaunch(command) async
  {
    if(await canLaunch(command))
      {
        await launch(command);
      }
  }
  CalendarController _calenderController;

  @override
  void dispose() {
    // TODO: implement dispose
    _calenderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor:c2,
        elevation: 0.3,
        title: Text('HandyGo'),
      ),

        drawer: DDrawer(),
      body: Column(
        children: [
          TableCalendar(
            calendarController: _calenderController,
            initialCalendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            formatAnimation: FormatAnimation.slide,
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
              leftChevronIcon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 15,),
              rightChevronIcon: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,),
              leftChevronMargin: EdgeInsets.only(left: 70),
              rightChevronMargin: EdgeInsets.only(right: 70),
            ),
            calendarStyle: CalendarStyle(
              weekendStyle: TextStyle(
                color: Colors.white
              ),
              weekdayStyle: TextStyle(
                  color: Colors.white
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(
                color: Colors.white
              ),
              weekdayStyle: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                topRight: Radius.circular(40),),
                color: Colors.white
              ),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('  Date of Booking:',style: TextStyle(
                            color: Colors.grey
                          ),)
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height - 80,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: ListView.builder(
                                //reverse: true,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:  dataToShow.length,
                                itemBuilder: (context, index) {

                                  return dayTask(

                                    context,

                                    dataToShow[index]["date"] ?? "",
                                    dataToShow[index]["emergencyService"] ?? "",
                                    dataToShow[index]["dueDate"] ?? "",
                                    dataToShow[index]['serviceType'] ?? "",
                                    dataToShow[index]['vehicleModel'] ?? "",

                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Column(
                      //   children: [
                      //     dayTask('10 am','Oil Change'),
                      //     dayTask('11 am', 'AC Repair'),
                      //     dayTask('11 am', 'AC Repair'),
                      //     dayTask('11 am', 'AC Repair'),
                      //
                      //   ],
                      // )
                    ],
                  ),
                )
              ),
            ),
          )

        ],
      ),
    );
  }

  Future notifSelected(String payload) async {
    var scheduleTime=DateTime.now().add(Duration(days: 90)).toString().substring(0,10);
    payload=='set'?showDialog(

      context: context,
      builder: (context) =>
          AlertDialog(
            backgroundColor: Colors.white,
            content: Text('''Your service is scheduled on 
            
            $scheduleTime
            
Thank you for choosing HandyGo!''',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),),
          ),
    ):false;
  }


    Row dayTask(BuildContext context,String date, String name,String dueDate,String serviceType,String vehicleName) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top:70,right: 1),
          width: MediaQuery.of(context).size.width*0.2,
          child: Text(
            date,style: TextStyle(
            color: c1,
            fontWeight: FontWeight.w700,
            fontSize: 12
          ),
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(20),
            color: Color(0xffdfdeff),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.w700
                ),),
                SizedBox(
                  height: 10,
                ),
                Text(serviceType,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500
                ),),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.timer,color: Colors.indigo,),
                    SizedBox(width:5 ,),
                    Text('Due Date: ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w600
                      ),),
                    Text('$dueDate',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                      fontWeight: FontWeight.w600
                    ),)
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text('Vehicle:',style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),),
                    SizedBox(width: 5,),
                    Text(vehicleName,style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.w500,
                    ),),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    InkWell(child: Icon(Icons.call,color: Colors.indigo,),
                    onTap: (){
                      customLaunch('tel: 09111884992');
                    },),
                    SizedBox(width: 30,),
                    Text('Set Reminder: ',style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),),
                    InkWell(child: Icon(Icons.timer,color: Colors.indigo,),
                      onTap: (){
                      _showNotifications();

                      },),
                    Expanded(
                      child: Container(),
                    ),

                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
