import 'package:flutter/material.dart';
import 'package:project/app/views/main/widgets/product_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 8 / 9,
      ),
      children: const <Widget>[
        ProductCard(image: "assets/makanan/ayam_bakar_madu.jpg", food: "Ayam bakar madu", price: "11,500"),
        ProductCard(image: "assets/makanan/ayam_geprek.jpg", food: "Ayam geprek", price: "12,000"),
        ProductCard(image: "assets/makanan/ayam_bakar_rica.jpg", food: "Ayam bakar rica", price: "23,000"),
        ProductCard(image: "assets/makanan/ayam_crispy.jpg", food: "Ayam crispy sambal", price: "12,500"),
      ],
    );
  }
}
