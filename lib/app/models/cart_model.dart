
import 'package:flutter/foundation.dart';

class CartModel with ChangeNotifier {
  final String id;
  final String productId;
  final String productName;
  final int qty;
  final int? productPrice;

  CartModel ({
    required this.id,
    required this.productId,
    required this.productName,
    required this.qty,
    required this.productPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json["id"],
    productId: json["productId"],
    productName: json["productName"],
    qty: json["qty"],
    productPrice: json["productPrice"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productId": productId,
    "productName": productName,
    "qty": qty,
    "productPrice": productPrice,
  };
}