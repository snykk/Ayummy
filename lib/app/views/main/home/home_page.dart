import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        ProductCard(image: "assets/makanan/ayam_bakar_rica.jpg", food: "Ayam bakar rica", price: "11,500"),
        ProductCard(image: "assets/makanan/ayam_crispy.jpg", food: "Ayam crispy sambal", price: "11,500"),
        ProductCard(image: "assets/makanan/ayam_geprek.jpg", food: "Ayam geprek bawang", price: "11,500"),
        ProductCard(image: "assets/makanan/ayam_goreng_mentega.jpg", food: "Ayam goreng mentega", price: "11,500"),
        ProductCard(image: "assets/makanan/ayam_teriyaki.jpeg", food: "Ayam teriyaki", price: "11,500"),
        ProductCard(image: "assets/makanan/ayam_pok_pok.jpg", food: "Ayam pokpok", price: "11,500"),
      ],
    );
  }
}
