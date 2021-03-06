import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ServiceApp {
  static const String appName = 'e-Shop';

  static SharedPreferences sharedPreferences;
  static FirebaseUser user;
  static FirebaseAuth auth;
  static Firestore firestore;

  static String collectionUser = "users";
  static String collectionOrders = "orders";
  static String userCartList = 'userCart';
  static String subCollectionAddress = 'userAddress';

  static final String userName = 'name';
  static final String userEmail = 'email';
  static final String userPhone = 'phone';
  static final String userUID = 'uid';
  static final String userAvatarUrl = 'url';

  static final String addressID = 'addressID';
  static final String totalAmount = 'totalAmount';
  static final String productID = 'productIDs';
  static final String paymentDetails = 'paymentDetails';
  static final String orderTime = 'orderTime';
  static final String isSuccess = 'isSuccess';

  static final String vehicleType = 'vehicleType';
  static final String vehicleBrand = 'vehicleBrand';
  static final String vehicleModel = 'vehicleModel';
  static final String serviceType = 'serviceType';
  static final String dateTime = 'dateTime';
  static final String registrationNumber = 'registrationNumber';
  static final String AMC_Opted = 'AMC_Opted';
  static final String emergencyService = 'emergencyService';
  static final String orders = 'orders';
  static final String date = 'date';
  static final String dueDate = 'dueDate';
  static final String ordersTotal = 'ordersTotal';
  static final String total = 'total';



}
