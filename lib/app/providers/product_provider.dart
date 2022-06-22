import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _allProducts = [];

  Future<void> setAllProduct() async {
    final data = await FirebaseFirestore.instance.collection("product").get();

    _allProducts = <ProductModel>[
      for (QueryDocumentSnapshot<Object?> item in data.docs)
        ProductModel.fromJson(item.data() as Map<String, dynamic>)
    ];
  }

  Future<void> setAllProductFav(userId) async {
    final data = await FirebaseFirestore.instance
        .collection("product")
        .where("userProductFav", arrayContains: userId)
        .get();

    _allProducts = <ProductModel>[
      for (QueryDocumentSnapshot<Object?> item in data.docs)
        ProductModel.fromJson(item.data() as Map<String, dynamic>)
    ];
  }

  List<ProductModel> get getAllProduct => _allProducts;

  Future<void> toggleFav(String uidProduct, bool isFav) async {
    await FirebaseFirestore.instance
        .collection("product")
        .doc(uidProduct)
        .update({"isFav": !isFav});
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
    QuerySnapshot<Object?> product = await FirebaseFirestore.instance
        .collection("product")
        .where("name", isEqualTo: name)
        .get();

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
          userProductFav: [],
        ).toJson(),
      );

      ScaffoldMessenger.of(context!).showSnackBar(
          const SnackBar(content: Text('Product berhasil ditambahkan')));

      Navigator.pushReplacementNamed(context, '/main').then(
        (_) => Navigator.pop(context),
      );
    }
  }

  void addToFav(productId, userId) {
    final productRef =
        FirebaseFirestore.instance.collection("product").doc(productId);
    final userRef = FirebaseFirestore.instance.collection("user").doc(userId);

    productRef.update({
      "userProductFav": FieldValue.arrayUnion([userId])
    });
    userRef.update({
      "productUserFav": FieldValue.arrayUnion([productId])
    });
  }

  void remoteToFav(productId, userId) {
    final productRef =
        FirebaseFirestore.instance.collection("product").doc(productId);
    final userRef = FirebaseFirestore.instance.collection("user").doc(userId);

    productRef.update({
      "userProductFav": FieldValue.arrayRemove([userId])
    });
    userRef.update({
      "productUserFav": FieldValue.arrayRemove([productId])
    });
  }

  Future<ProductModel> getProductById(String prodId) async {
    final data = await FirebaseFirestore.instance
        .collection("product")
        .doc(prodId)
        .get();
    return ProductModel.fromJson(data.data() as Map<String, dynamic>);
  }
}
