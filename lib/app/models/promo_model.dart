import 'package:flutter/foundation.dart';

class PromoModel with ChangeNotifier {
  final String name;
  final String detail;

  PromoModel ({
    required this.name,
    required this.detail,
  });

  factory PromoModel.fromJson(Map<String, dynamic> json) => PromoModel(
    name: json["name"],
    detail: json["detail"]
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "detail": detail,
  };
}