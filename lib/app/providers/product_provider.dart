import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _allProducts = [];

  Future<void> setAllProduct() async {
    final data = await FirebaseFirestore.instance.collection("product").get();

    _allProducts = <ProductModel>[
      for (QueryDocumentSnapshot<Object?> item in data.docs) ProductModel.fromJson(item.data() as Map<String,dynamic>)
    ];
  }

  List<ProductModel> get getAllProduct {
    return [..._allProducts];
  }

  List<ProductModel> get favProducts {
    return [..._allProducts.where((element) => element.isFav)];
  }

  Future<void> toggleFav(String uidProduct, bool isFav) async {
    await FirebaseFirestore.instance.collection("product").doc(uidProduct).update({"isFav": !isFav});
    notifyListeners();
  }

  Future<void> addProduct({
      BuildContext? context,
      required String name,
      required int price,
      required int qty,
      required String imageUrl,
      required String desc,
    }) async {
    QuerySnapshot<Object?> product = await FirebaseFirestore.instance.collection("product").where("name", isEqualTo: name).get();
    
    final newProduct = FirebaseFirestore.instance.collection("product").doc();
    if (product.docs.isEmpty) {
      await newProduct.set(
        ProductModel(
          id: newProduct.id,
          name: name,
          price: price,
          qty: qty,
          sold: 0,
          description: desc,
          imageUrl: imageUrl,
          isFav: false,
        ).toJson(),
      );

      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(content: Text('Product berhasil ditambahkan')));

      Navigator.pushReplacementNamed(context, '/main').then(
        (_) => Navigator.pop(context),
      );
    }
  }
}
