import 'package:flutter/foundation.dart';

class OrderModel with ChangeNotifier {
  final String id;
  final String userId;
  final String paymentMethod;
  final List<Map<String, dynamic>> orderDetails;
  final int totalPrice;
  final DateTime createAt;

  OrderModel({
    required this.id,
    required this.userId,
    required this.paymentMethod,
    required this.orderDetails,
    required this.totalPrice,
    required this.createAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        userId: json["userId"],
        paymentMethod: json["paymentMethod"],
        orderDetails: json["orderDetails"] as List<Map<String, dynamic>>,
        totalPrice: json["totalPrice"],
        createAt: json["createAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "paymentMethod": paymentMethod,
        "orderDetails": orderDetails,
        "totalPrice": totalPrice,
        "createAt": createAt,
      };
}
