import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PromoModel with ChangeNotifier {
  final String id;
  final String categoryId;
  final String name;
  final String detail;
  final List<dynamic> userAlreadyTake;

  PromoModel ({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.detail,
    required this.userAlreadyTake,
  });

  factory PromoModel.fromJson(Map<String, dynamic> json) => PromoModel(
    id: json["id"],
    categoryId: json["category_id"],
    name: json["name"],
    detail: json["detail"],
    userAlreadyTake: json["userAlreadyTake"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "name": name,
    "detail": detail,
    "userAlreadyTake": userAlreadyTake,
  };
}