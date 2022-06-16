
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/app/models/order_model.dart';


class OrderProvider with ChangeNotifier {
  List<OrderModel> _allOrders = [];

  Future<void> setAllOrder() async {
    final data = await FirebaseFirestore.instance.collection("order").get();

    _allOrders = <OrderModel>[
      for (QueryDocumentSnapshot<Object?> item in data.docs) OrderModel.fromJson(item.data() as Map<String,dynamic>)
    ];
  }

  List<OrderModel> get getAllOrder {
    return [..._allOrders];
  }

  Future<void> addOrder({
      BuildContext? context,
      required String id,
      required String paymentMethod,
      required List<dynamic> details,
      required int totalPrice,
    }) async {
    QuerySnapshot<Object?> order = await FirebaseFirestore.instance.collection("order").where("id", isEqualTo: id).get();
    
    final newOrder = FirebaseFirestore.instance.collection("order").doc();
    if (order.docs.isEmpty) {
      await newOrder.set(
        OrderModel(
          id: newOrder.id,
          paymentMethod: paymentMethod,
          isPayed: false,
          details: details,
          totalPrice: totalPrice,
          createAt: DateTime.now(),
        ).toJson(),
      );
    }
  }
}