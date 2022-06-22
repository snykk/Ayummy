import 'package:flutter/material.dart';

class CartModel with ChangeNotifier {
  final String id;
  final String userId;
  final String productId;
  int qty;

  CartModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.qty,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        userId: json["userId"],
        productId: json["productId"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "productId": productId,
        "qty": qty,
      };

  set changeQty(int value) {
    qty += value;
    notifyListeners();
  }
}
