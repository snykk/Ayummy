import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

import 'package:provider/provider.dart';
import 'package:project/app/providers/product_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);

    final allproduct = productData.allproducts;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      itemCount: allproduct.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 8 / 9,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: allproduct[i],
        child: const ProductCard()
      ),
    );
  }
}
