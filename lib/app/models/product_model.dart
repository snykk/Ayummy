import 'package:flutter/foundation.dart';

class ProductModel with ChangeNotifier {
  final String id;
  final String name;
  final String price;
  final String description;
  final String imageUrl;
  final int sold;
  bool isFav;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.sold,
    this.isFav = false,
  });

  void toggleFav() {
    isFav = !isFav;
    notifyListeners();
  }
}
