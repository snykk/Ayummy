import 'package:cloud_firestore/cloud_firestore.dart';

class MyCollection {
  static CollectionReference<Map<String, dynamic>> user =
      FirebaseFirestore.instance.collection("user");
  static CollectionReference<Map<String, dynamic>> order =
      FirebaseFirestore.instance.collection("order");
  static CollectionReference<Map<String, dynamic>> cart =
      FirebaseFirestore.instance.collection("cart");
  static CollectionReference<Map<String, dynamic>> product =
      FirebaseFirestore.instance.collection("product");
  static CollectionReference<Map<String, dynamic>> promo =
      FirebaseFirestore.instance.collection("promo");
  static CollectionReference<Map<String, dynamic>> rating =
      FirebaseFirestore.instance.collection("rating");
}
