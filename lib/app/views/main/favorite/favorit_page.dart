import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';
import '../detail_menu/detail_menu_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final myCurr = NumberFormat("#,##0", "en_US");
    Provider.of<ProductProvider>(context, listen: false).setAllProduct();
    final favProduct = Provider.of<ProductProvider>(context).favProducts;

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
        child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          // lempar value dari ProductModel ke detail menu page
          MaterialPageRoute(builder: (context) {
            return ChangeNotifierProvider.value(
                value: favProduct[i], child: const DetailMenuPage(),
            );
          }),
        ).then((_) {
          setState(() {});
        });
        // Navigator.pushNamed(context, '/detail', arguments: product.id);
      },
      child: Card(
        child: Container(
          width: 130,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(favProduct[i].imageUrl),
                  ),
                ),
              ),
              Center(
                child: Text(
                  favProduct[i].name,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                heightFactor: 2.5,
              ),
              Center(
                child: Text(
                   "Rp. ${myCurr.format(favProduct[i].price)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        elevation: 8,
        shadowColor: Colors.black,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white, width: 1)),
      ),
    )
      ),
    );
  }
}
