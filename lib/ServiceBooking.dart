import 'package:car_service/AnnualMS.dart';
import 'package:car_service/VehiclesList.dart';
import 'package:car_service/genRepairs.dart';
import 'package:car_service/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:car_service/vServices.dart';
import 'drawer.dart';

String dateTime1;
int orders=0;
class BookingForm extends StatefulWidget {
  BookingForm({this.emergencyService});
  final String emergencyService;
  @override
  _BookingFormState createState() => _BookingFormState();
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
String vehicleRegistrationNumber;
class _BookingFormState extends State<BookingForm> {
  String selectedType='2-wheeler';
  String selectedServiceType='Door-step';
  String selectedMake='Select Make';
  TextEditingController name = TextEditingController();
  TextEditingController mp = TextEditingController();
  TextEditingController reg = TextEditingController();
  TextEditingController txt = TextEditingController();
  TextEditingController no = TextEditingController();
  final _dateEditingController = TextEditingController();
  bool isChecked=true;
  DateTime dateTime;
  DateTime currentdateTime=DateTime.now();
  final _key = GlobalKey<FormState>();
  //String selectedMake1='MARUTI SUZUKI';
  void auth() {
    // print(mp.text);
    // print(reg.text);
    if(selectedType!=null && selectedServiceType!=null && selectedMake!='Select Make' && name.text!=null && mp.text!=''&&reg.text!=''&&txt.text!=''&&no.text!=''&&_dateEditingController.text!=null )
      {
        showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Booking Confirmed!'),
            content: new Text('You will receive a call from our technician within 5 minutes'),
            actions: <Widget>[

              // SizedBox(height: 16),
              new GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context)=>HomePage()
                )),
                child: Text("Okay"),
              ),
            ],
          ),
        );
      }else{
      showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Please enter details!'),
          actions: <Widget>[
            new GestureDetector(
              onTap: () => Navigator.of(context).pop(true),
              child: Text("Okay"),
            ),



          ],
        ),
      );
    }
  }

  DropdownButton<String> androidDropdown1() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    List gaadi=selectedType=='2-wheeler'?twoList:fourList;
    for (String vehicle in gaadi) {
      var newItem = DropdownMenuItem(
        child: Text(vehicle,
        style: TextStyle(
          color: c1
        ),),
        value: vehicle,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(

      icon: Icon(Icons.arrow_drop_down,color: Colors.black,),

      dropdownColor: Colors.white,
      elevation: 8,
      value: selectedMake,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedMake = value;

        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c2,
      appBar: AppBar(
        backgroundColor:c2,
        elevation: 0.3,
        title: Text('HandyGo'),
      ),

      drawer: DDrawer(),

      body: Form(
        key: _key,
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft:Radius.circular(40) ,topRight: Radius.circular(40)),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text('Select Vehicle',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: c1
                  ),),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          changVehicleType('2-wheeler');
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 100,

                              width:MediaQuery.of(context).size.width*0.43 ,
                              decoration: BoxDecoration(

                                color: c4,
                                image:DecorationImage(
                                  image: AssetImage(
                                    'assets/img16.jpeg'
                                  )
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20)),

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '2-Wheeler',
                              style: TextStyle(

                                  fontWeight: FontWeight.w600,
                                  color: c1
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffededed),
                              ),
                              child: (selectedType=='2-wheeler')?Icon(Icons.check_circle,
                              color: Colors.pink,
                              size: 20,):Container(),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          changVehicleType('4-wheeler');
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width:MediaQuery.of(context).size.width*0.43 ,
                              decoration: BoxDecoration(
                                color: c4,
                                image:DecorationImage(
                                    image: AssetImage(
                                        'assets/img17.jpeg'
                                    )
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20)),

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '4-Wheeler',
                              style: TextStyle(

                                  fontWeight: FontWeight.w600,
                                  color: c1
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffededed),
                              ),
                              child: (selectedType=='4-wheeler')?Icon(Icons.check_circle,
                                color: Colors.pink,
                                size: 20,):Container(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 20,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Select Make',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: c1
                            ),),
                          SizedBox(
                            height: 10,
                          ),
                          androidDropdown1(),

                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Select Model',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: c1
                            ),),
                          SizedBox(
                            height: 10,
                          ),
                          androidDropdown1(),

                        ],
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Select Service Type',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: c1
                    ),),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          changedSType('Door-Step');
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedServiceType=='Door-Step')?BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.all(Radius.circular(10)),

                          ):BoxDecoration(
                            border:Border.all(color: Colors.black.withOpacity(0.3)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),

                          ),
                          child: Center(
                            child:Text(
                              'Door-Step',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: (selectedServiceType=='Door-Step')?Colors.white:c1,

                            ),
                            )
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          changedSType('Roadside Assistance');
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedServiceType=='Roadside Assistance')?BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.all(Radius.circular(10)),

                          ):BoxDecoration(
                            border:Border.all(color: Colors.black.withOpacity(0.3)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),

                          ),
                          child: Center(
                              child:Text(
                                '''Roadside 
Assistance''',style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: (selectedServiceType=='Roadside Assistance')?Colors.white:c1,

                              ),
                              )
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          changedSType('Home Pickup & Drop');
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedServiceType=='Home Pickup & Drop')?BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.all(Radius.circular(10)),

                          ):BoxDecoration(
                            border:Border.all(color: Colors.black.withOpacity(0.3)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),

                          ),
                          child: Center(
                              child:Text(
                                '''Pickup and
Drop''',style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: (selectedServiceType=='Home Pickup & Drop')?Colors.white:c1,

                              ),
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 20,
                  ),
                  Text('Pick a Date',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: c1
                    ),),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border:Border.all(color: Colors.black.withOpacity(0.3)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 60,
                      width: MediaQuery.of(context).size.width*0.7,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: FormBuilderDateTimePicker(
                          initialValue: DateTime.now() ,
                          style: TextStyle(

                            color: c1
                          ),
                          controller: _dateEditingController,
                          attribute: "date",
                          inputType: InputType.both,
                          onChanged: (DateTime value) {
                            setState(() {
                              dateTime = value;
                              dateTime1=dateTime.add(Duration(days: 90)).toString().substring(0,10);
                            });
                            dateTime1=dateTime.add(Duration(days: 90)).toString().substring(0,10);
                            print(dateTime1);



                          },
                          //validators: [
                          // FormBuilderValidators.date(),
                          //],
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.grey
                            ),
                            fillColor: c2,
                            focusColor: c2,
                            icon: Icon(
                              Icons.calendar_today,
                              color: c2,
                            ),
                            labelText: "Booking Date",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Enter Vehicle Registration Number',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: c1
                    ),),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                          border:Border.all(color: Colors.black.withOpacity(0.3)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:12.0),
                          child: Center(
                            child: FormBuilderTextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: c1,
                              ),
                              decoration: InputDecoration(
                                hintText: "MP",
                                hintStyle: TextStyle(

                                  color: Colors.grey,
                                ),
                              ),
                              controller: mp,
                              attribute: "Mp",


                            ),
                          ),
                        ),
                        // validators: [],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('-',
                      style: TextStyle(
                        color: c1
                      ),),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                          border:Border.all(color: Colors.black.withOpacity(0.3)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:12.0),
                          child: Center(
                            child: FormBuilderTextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: c1,
                              ),
                              decoration: InputDecoration(
                                hintText: "20",
                                hintStyle: TextStyle(

                                  color: Colors.grey,
                                ),
                              ),
                              controller: reg,
                              attribute: "20",


                            ),
                          ),
                        ),
                        // validators: [],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('-',
                        style: TextStyle(
                            color: c1
                        ),),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                          border:Border.all(color: Colors.black.withOpacity(0.3)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:12.0),
                          child: Center(
                            child: FormBuilderTextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: c1,
                              ),
                              decoration: InputDecoration(
                                hintText: "SM",
                                hintStyle: TextStyle(

                                  color: Colors.grey,
                                ),
                              ),
                              controller: txt,
                              attribute: "SM",


                            ),
                          ),
                        ),
                        // validators: [],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('-',
                        style: TextStyle(
                            color: c1
                        ),),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                          border:Border.all(color: Colors.black.withOpacity(0.3)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:12.0),
                          child: Center(
                            child: FormBuilderTextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: c1,
                              ),
                              decoration: InputDecoration(
                                hintText: "7777",
                                hintStyle: TextStyle(

                                  color: Colors.grey,
                                ),
                              ),
                              controller: no,
                              attribute: "1234",


                            ),
                          ),
                        ),
                        // validators: [],
                      ),


                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 10,
                  ),
                  ListTile(

                    title: Text(
                      'Opt in for AMC',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: c1,
                      ),
                    ),
                    subtitle: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>AMS(),
                        ));
                      },
                      child: Text('Know More',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue
                      ),),
                    ),
                    trailing: InkWell(
                      onTap: (){
                        setState(() {
                          isChecked=!isChecked;
                        });
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffededed),
                        ),
                        child: isChecked?Icon(Icons.check_circle,
                          color: Colors.pink,
                          size: 20,):Container(),
                      ),
                    )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child:InkWell(
                      splashColor: Colors.black,
                      highlightColor: c1,
                      onTap: (){
                        auth();
                        emergencyServices='';
                        onSaved();
                        print(widget.emergencyService);

                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          border:Border.all(color: Colors.black.withOpacity(0.3)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text('Submit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: c1
                          ),),
                        ),
                        // validators: [],
                      ),
                    ),
                  )







                ],
              ),
            )],
        ),
      ),
    );
  }
  onSaved() async {
    vehicleRegistrationNumber=mp.text+reg.text+txt.text+no.text;
    final sharerRef = Firestore.instance.collection("Orders");
    bool isValid = false;
    if (_key.currentState != null) {
      isValid = _key.currentState.validate();
      _key.currentState.save();
    }
    if (!isValid) {
      return;
    } else {
      await sharerRef.add({
        "name": ServiceApp.sharedPreferences.getString(ServiceApp.userName),
        "contact": ServiceApp.sharedPreferences.getString(ServiceApp.userPhone),
        "vehicleType": selectedType,
        "vehicleBrand":selectedMake ,
        "vehicleModel":selectedMake,
        "serviceType":selectedServiceType,
        "dateTime": dateTime.toString(),
        "registrationNumber": vehicleRegistrationNumber.toUpperCase(),
        "AMC_Opted": isChecked.toString(),
        "emergencyService": ServiceApp.sharedPreferences.getString(ServiceApp.emergencyService),
        "date":dateTime.toString().substring(0,10),
        "dueDate":dateTime1,
        // "uid": ServiceApp.user.uid,
      });

      await ServiceApp.sharedPreferences
          .setString(ServiceApp.vehicleType, selectedType);
      await ServiceApp.sharedPreferences
          .setString(ServiceApp.vehicleBrand, selectedMake);
      await ServiceApp.sharedPreferences
          .setString(ServiceApp.vehicleModel, selectedMake);
      await ServiceApp.sharedPreferences
          .setString(ServiceApp.serviceType, selectedServiceType);
      await ServiceApp.sharedPreferences
          .setString(ServiceApp.dateTime, dateTime.toString(),);
      await ServiceApp.sharedPreferences
          .setString(ServiceApp.registrationNumber, vehicleRegistrationNumber);
      await ServiceApp.sharedPreferences
          .setString(ServiceApp.AMC_Opted, isChecked.toString());
      await ServiceApp.sharedPreferences
          .setString(ServiceApp.date, dateTime.toString().substring(0,10));
      await ServiceApp.sharedPreferences
          .setString(ServiceApp.dueDate,dateTime1 );



    }
  }

  void changVehicleType(String type) {
    selectedType=type;
    setState(() {

    });
  }

  void changedSType(String type) {
    selectedServiceType=type;
    setState(() {

    });
  }


}
