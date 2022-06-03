import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';
import '../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final allProduct = Provider.of<ProductProvider>(context, listen: false).allproducts;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      itemCount: allProduct.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 8 / 9,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: allProduct[i],
        child: const ProductCard(),
      ),
    );
  }
}
