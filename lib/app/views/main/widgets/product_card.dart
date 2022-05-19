import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductModel>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: productData.id);
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
                    image: AssetImage(productData.imageUrl),
                  ),
                ),
              ),
              Center(
                child: Text(
                  productData.name,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                heightFactor: 2.5,
              ),
              Center(
                child: Text(
                  "Rp. ${productData.price}",
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
    );
  }
}
