import 'package:car_service/drawer.dart';
import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  static const String id = 'Help';
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          backgroundColor: c4,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xffeeeeee),
            ),
            title: Center(child: Text('Help & Support')),
            elevation: 0,
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
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, right: 20.0, left: 20.0),
                      child: Column(
                        children: <Widget>[
                          ExpansionTile(
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: Text(
                                    '''Service booking from HandyGo app is a simple proces...

Select the make of your vehicle from the options provided on the home page.

Next select the cc value of your vehicle from the list.


Select the model for your vehicle (if your vehicle model has more than one variant you can choose any variant of that model for example; if your model is a Honda Activa5G you can choose Activa i as well)

Select the service option that is best suited to you (i.e. Home Pickup, if you want us to pick your vehicle from your location, Doorstep Service(for selected repairs only), if you want one of our technicians to visit your place and do the repair works for you, OR Roadside Assistance(requires an advance payment of INR200), if you've got a vehicle breakdown and need someone to help we are always there to cover you.


Just submit your vehicle registration number and your service will be booked with us shortly after which you will receive a confirmation call from one of our executives to assist you further with the booking.

''',
                                    style: TextStyle(
                                      color: c4,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            title: Text(
                              'How to book a service with HandyGo?',
                              style: TextStyle(
                                color: c4,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.question_answer,
                              color: c4,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [c2, c10])),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, right: 20.0, left: 20.0),
                      child: Column(
                        children: <Widget>[
                          ExpansionTile(
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: Text(
                                    '''We have a easy to use process in place for our customers. Once you book the service after registering on the app, we shall arrange for the service as per your selected mode of service. In case of minor repairs the repairs will be done at customer's place else the vehicle will have to be taken to our workshop, where  we will diagnose the vehicle and based on the underlying problem, we shall provide you with a detailed report along with an estimate and our expert recommendations(if any). Once the estimate is approved by you, only then shall we proceed further and start the repairs and only after a strict quality inspection we deliver the vehicle back to the same address as the pickup. The old/used parts can be requested by the customer only at the time of pickup and before the repairs have been started(as once the repair work has started we will not be able to honour any such requests).
Once your vehicle is ready you will receive a message confirmation about the same after which you will be required to pay 50% of the bill amount in advance and once the payment is received by us your vehicle will be released from the workshop and delivered to you. Once you have received your vehicle you can test drive your vehicle and the release the remaining bill amount before taking complete delivery of the vehicle.

''',
                                    style: TextStyle(
                                      color: c4,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            title: Text(
                              'How does HandyGo service works?',
                              style: TextStyle(
                                color: c4,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.question_answer,
                              color: c4,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [c2, c10])),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, right: 20.0, left: 20.0),
                      child: Column(
                        children: <Widget>[
                          ExpansionTile(
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: Text(
                                    '''We guarantee 100% more detailed service as compared to an authorized service center. For bike, we have a checklist of atleast 50 service points.
For car, we have a checklist of atleast 70 service points.
''',
                                    style: TextStyle(
                                      color: c4,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            title: Text(
                              'What aspects will be covered under the General service for bike/car?',
                              style: TextStyle(
                                color: c4,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.question_answer,
                              color: c4,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [c2, c10])),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, right: 20.0, left: 20.0),
                      child: Column(
                        children: <Widget>[
                          ExpansionTile(
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: Text(
                                    '''HandyGo services is the most affordable service in the market at the moment, our prices help you save around 40%-70% (based on work, mechanic work, body work etc.) as compared to an authorized service center topped with far superior quality of service and support.

''',
                                    style: TextStyle(
                                      color: c4,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            title: Text(
                              "How does HandyGo prices fare against the market price?",
                              style: TextStyle(
                                color: c4,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.question_answer,
                              color: c4,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [c2, c10])),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, right: 20.0, left: 20.0),
                      child: Column(
                        children: <Widget>[
                          ExpansionTile(
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: Text(
                                    '''We will not be able to provide general doorstep due to many reasons. Mainly, 
a. For satisfactory general service, appropriate setup like, ramps, pneumatic system, motor winding, washing, etc. are required which are available in our facility 
b. It will not be possible for our technician to carry all the tools to customer's place.
c. In case any spare parts are needed,it will be cumbersome to travel back and forth to the workshop to get the spare parts.
d. The technician might need a helping hand to perform the service. 
e. Proper disposal of the used spare parts or consumables will not be possible(which is mandatory)as we strongly support the swachh bharat abhiyan and have very strict pollution control policies in place in accordance with the pollution control laws of india.

''',
                                    style: TextStyle(
                                      color: c4,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            title: Text(
                              "Does HandyGo provide Doorstep general service?",
                              style: TextStyle(
                                color: c4,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.question_answer,
                              color: c4,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [c2, c10])),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, right: 20.0, left: 20.0),
                      child: Column(
                        children: <Widget>[
                          ExpansionTile(
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: Text(
                                    '''There is no charge if the pickup is within a range of 5 KM from workshop location. If this range is exceeded, our customer support agent will confirm the pickup charges before sending the technician.

''',
                                    style: TextStyle(
                                      color: c4,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            title: Text(
                              'Is there any charge for pickup and drop?',
                              style: TextStyle(
                                color: c4,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.question_answer,
                              color: c4,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [c2, c10])),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, right: 20.0, left: 20.0),
                      child: Column(
                        children: <Widget>[
                          ExpansionTile(
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: Text(
                                    '''Roadside assistance is a facility that is given by HandyGo services to its customers so they never have to worry in case of a vehicle breakdown. Whenever you have a vehicle breakdown just select the Roadside assistance option on your app and book a service and one of our technicians will reach wherever you are to help you out and get your vehicle running.
                   
''',
                                    style: TextStyle(
                                      color: c4,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            title: Text(
                              'How Does Roadside assistance work?',
                              style: TextStyle(
                                color: c4,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.question_answer,
                              color: c4,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [c2, c10])),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, right: 20.0, left: 20.0),
                      child: Column(
                        children: <Widget>[
                          ExpansionTile(
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: Text(
                                    '''Our technician will arrive at your doorstep within 30-45 minutes (time may vary based on slot availability and other external factors like, traffic etc.) or at your specified time window. (Eg. 12 PM - 1 PM) it is advised to ask the technician for his HandyGo Id card to ensure you that you hand-over your vehicle to the right person. Technician's name will be texted to your registered mobile number before pickup.

''',
                                    style: TextStyle(
                                      color: c4,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            title: Text(
                              'How soon can I expect a technician to arrive at my doorstep for pickup?',
                              style: TextStyle(
                                color: c4,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.question_answer,
                              color: c4,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [c2, c10])),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, right: 20.0, left: 20.0),
                      child: Column(
                        children: <Widget>[
                          ExpansionTile(
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: Text(
                                    '''For Bike - We would require around 45-60 minutes to completely diagnose the vehicle and send across the report, however, the time duration may vary if there are other service requirements along with the general service. For bike, we would require around 2-5 hours to complete the work. 

For Car - We would require around 90-120 minutes to diagnose the vehicle and send across the report, however, the time duration may vary if there are other service requirements along with the general service. For car, we would require around 5-7 hours to complete the work.

''',
                                    style: TextStyle(
                                      color: c4,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            title: Text(
                              'What is the timeframe for a complete diagnosis of the vehicle and for General service?',
                              style: TextStyle(
                                color: c4,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.question_answer,
                              color: c4,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [c2, c10])),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, right: 20.0, left: 20.0),
                      child: Column(
                        children: <Widget>[
                          ExpansionTile(
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: Text(
                                    '''We care about you and your vehicle. Hence at HandyGo services we use only as genuine spare parts which will be from any one of recommended spare parts supplied by OEM.

''',
                                    style: TextStyle(
                                      color: c4,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            title: Text(
                              'Are genuine spare parts used for my vehicle?',
                              style: TextStyle(
                                color: c4,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.question_answer,
                              color: c4,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [c2, c10])),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, right: 20.0, left: 20.0),
                      child: Column(
                        children: <Widget>[
                          ExpansionTile(
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: Text(
                                    '''You need to make an advance payment of 50% of the final bill amount once your vehicle is ready after the repairs(for which you will receive a confirmation call/SMS) once the payment is received your vehicle will be released from the workshop and when you have received the vehicle and taken a test ride of the same you shall pay the remaining bill amount.

As of now we accept only online payments which you can make via payments section in the sidebar of the app,  we provide you with direct payment through by Google Pay by scanning the barcode via payments section in side-bar. We do accept cash also in services where approximate cost of service cannot be known in advance.

''',
                                    style: TextStyle(
                                      color: c4,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            title: Text(
                              'When do i need to make payment and what is the mode of payment?',
                              style: TextStyle(
                                color: c4,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.question_answer,
                              color: c4,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [c2, c10])),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
