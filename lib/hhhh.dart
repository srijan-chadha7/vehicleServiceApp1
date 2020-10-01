import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:shopapp/pages/prod_dea.dart';

class RecentProducts extends StatelessWidget {
  final prodList = [
    {
      'name': 'Blazer',
      'image': 'images/blazer1.jpeg',
      'oldPrice': 3999,
      'price': 1499
    },
    {
      'name': 'Red-Dress',
      'image': 'images/dress1.jpeg',
      'oldPrice': 2999,
      'price': 999
    },
    {
      'name': 'Footwear',
      'image': 'images/hills1.jpeg',
      'oldPrice': 1899,
      'price': 899
    },
    {
      'name': 'Pants',
      'image': 'images/pants1.jpg',
      'oldPrice': 1599,
      'price': 799
    },
    {
      'name': 'Long Skirt',
      'image': 'images/skt1.jpeg',
      'oldPrice': 999,
      'price': 699
    },
    {
      'name': 'Short Skirt',
      'image': 'images/skt2.jpeg',
      'oldPrice': 999,
      'price': 599
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 4,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Card(
              //color: Colors.white,
              );
        });
  }
}

class SingleProd extends StatelessWidget {
  SingleProd(
      {this.prodName, this.prodImage, this.prodOldPrice, this.prodPrice});
  final prodName;
  final prodImage;
  final prodOldPrice;
  final prodPrice;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prodName,
        child: Material(
          child: InkWell(
            // onTap: () =>
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return ProductDetails(
            //     prodName: prodName,
            //     prodImage: prodImage,
            //     prodOldPrice: prodOldPrice,
            //     prodPrice: prodPrice,
            //   );
            // })),
            child: GridTile(
              child: Image.asset(
                prodImage,
                fit: BoxFit.cover,
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    prodName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '₹$prodPrice',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        '₹$prodOldPrice',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
//                  title: Text(
//                    '₹$prodPrice',
//                    style: TextStyle(
//                      color: Colors.red,
//                      fontWeight: FontWeight.w800,
//                    ),
//                  ),
//                  subtitle: Text(
//                    '₹$prodOldPrice',
//                    style: TextStyle(
//                      color: Colors.grey,
//                      fontWeight: FontWeight.w800,
//                      decoration: TextDecoration.lineThrough,
//                    ),
//                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
