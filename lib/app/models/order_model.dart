
import 'package:flutter/foundation.dart';

class OrderModel with ChangeNotifier {
  final String id;
  final String paymentMethod; 
  final bool isPayed;
  final List<dynamic> details;
  final int totalPrice;
  final DateTime createAt;

  OrderModel ({
    required this.id,  
    required this.paymentMethod,  
    required this.isPayed,  
    required this.details,  
    required this.totalPrice,  
    required this.createAt,  
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"],
    paymentMethod: json["paymentMethod"],
    isPayed: json["isPayed"],
    details: json["details"],
    totalPrice: json["totalPrice"],
    createAt: json["createAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,   
    "paymentMethod": paymentMethod,   
    "isPayed": isPayed,           
    "details": details,           
    "totalPrice": totalPrice,
    "createAt": createAt,
  };
}