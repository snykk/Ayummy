import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';
import '../widgets/product_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favProduct = Provider.of<ProductProvider>(context, listen: false).favProducts;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      itemCount: favProduct.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 8 / 9,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: favProduct[i],
        child: const ProductCard()
      ),
    );
  }
}
