import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/app/models/orderr_model.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orderData = [];

  Future<void> setOrderData() async {
    final data = await FirebaseFirestore.instance.collection("order").get();

    _orderData = <OrderModel>[
      for (QueryDocumentSnapshot<Object?> item in data.docs)
        OrderModel.fromJson(item.data() as Map<String, dynamic>)
    ];
  }

  List<OrderModel> get getAllOrder => _orderData;

  Future<void> addOrder({
    BuildContext? context,
    required String userId,
    required String paymentMethod,
    required List<Map<String, dynamic>> orderDetails,
    required int totalPrice,
  }) async {
    final newOrder = FirebaseFirestore.instance.collection("order").doc();

    await newOrder.set(
      OrderModel(
        id: newOrder.id,
        userId: userId,
        paymentMethod: paymentMethod,
        orderDetails: orderDetails,
        totalPrice: totalPrice,
        createAt: DateTime.now(),
      ).toJson(),
    );

    Navigator.pushNamed(context!, '/pembayaran_berhasil').then(
      (_) => Navigator.pop(context),
    );
  }
}
