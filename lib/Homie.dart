import 'package:car_service/HomeGrid.dart';
import 'package:car_service/hhhh.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'AnnualMS.dart';

class Homie extends StatefulWidget {
  @override
  _HomieState createState() => _HomieState();
}

class _HomieState extends State<Homie> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = Container(
      height: 200,
      child: Carousel(
        onImageTap: (int index) {
          if (index == 0)
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AMS()));
        },
        boxFit: BoxFit.cover,
        images: [
          NetworkImage(
              'https://4.imimg.com/data4/UJ/IC/MY-25831940/annual-maintenance-contract-500x500.png'),
          NetworkImage('https://i.ytimg.com/vi/EW7UKAklle4/maxresdefault.jpg'),
          AssetImage('bsm.jpg'),
          // AssetImage('images/m1.jpeg'),
          // AssetImage('images/c1.jpg'),
          // AssetImage('images/w4.jpeg'),
          // AssetImage('images/m2.jpg'),
        ],
        autoplay: true,
        animationDuration: Duration(milliseconds: 1000),
        animationCurve: Curves.fastOutSlowIn,
        dotSize: 4.0,
        indicatorBgPadding: 4.0,
      ),
    );
    return ListView(children: <Widget>[
      imageCarousel,
      Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          'Categories',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      Container(height: 500, child: HomeGrid())
    ]);
  }
}
