import 'package:flutter/foundation.dart';

class ProductModel with ChangeNotifier {
  final String id;
  final String name;
  final int price;
  final String description;
  final String imageUrl;
  final int qty;
  final int sold;
  final List<dynamic> userProductFav;
  final List<dynamic> userAlreadyReview;
  // bool isFav;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.qty,
    required this.sold,
    required this.userProductFav,
    required this.userAlreadyReview,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        qty: json["qty"],
        sold: json["sold"],
        userProductFav: json["userProductFav"],
        userAlreadyReview: json["userAlreadyReview"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "imageUrl": imageUrl,
        "qty": qty,
        "sold": sold,
        "userProductFav": userProductFav,
        "userAlreadyReview": userAlreadyReview,
      };

  void addToFav(userId) {
    userProductFav.add(userId);
    notifyListeners();
  }

  void removeToFav(userId) {
    userProductFav.remove(userId);
    notifyListeners();
  }
}
