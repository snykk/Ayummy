import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/app/models/order_model.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orderData = [];
  final List<String> _orderedProduct = [];

  Future<void> setOrderData(userId) async {
    final data = await FirebaseFirestore.instance
        .collection("order")
        .where("userId", isEqualTo: userId)
        .get();
    _orderData = <OrderModel>[
      for (QueryDocumentSnapshot<Object?> item in data.docs)
        OrderModel.fromJson(item.data() as Map<String, dynamic>)
    ];
  }

  Future<void> setOrderedProduct(userId) async {
    final data = await FirebaseFirestore.instance
        .collection("order")
        .where("userId", isEqualTo: userId)
        .get();

    for (QueryDocumentSnapshot<Object?> item in data.docs) {
      Map<String, dynamic> a = item.data() as Map<String, dynamic>;

      for (Map<String, dynamic> orderDetail in a["orderDetails"]) {
        if (!(_orderedProduct.contains(orderDetail["productId"]))) {
          _orderedProduct.add(orderDetail["productId"]);
        }
      }
    }
  }

  List<OrderModel> get getAllOrder => _orderData;
  List<String> get getAllOrderedProduct => _orderedProduct;

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
