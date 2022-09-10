import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/collection.dart';
import '../models/product_model.dart';
import '../routes/route.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _allProducts = [];

  Future<void> setAllProduct() async {
    final data = await MyCollection.product.get();

    _allProducts = <ProductModel>[
      for (QueryDocumentSnapshot<Object?> item in data.docs)
        ProductModel.fromJson(item.data() as Map<String, dynamic>)
    ];
  }

  Future<void> setAllProductFav(userId) async {
    final data = await MyCollection.product.where("userProductFav", arrayContains: userId).get();

    _allProducts = <ProductModel>[
      for (QueryDocumentSnapshot<Object?> item in data.docs)
        ProductModel.fromJson(item.data() as Map<String, dynamic>)
    ];
  }

  List<ProductModel> get getAllProduct => _allProducts;

  Future<void> toggleFav(String uidProduct, bool isFav) async {
    await MyCollection.product.doc(uidProduct).update({"isFav": !isFav});
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
    QuerySnapshot<Object?> product =
        await MyCollection.product.where("name", isEqualTo: name).get();

    final newProduct = MyCollection.product.doc();
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
          userAlreadyReview: [],
        ).toJson(),
      );

      ScaffoldMessenger.of(context!)
          .showSnackBar(const SnackBar(content: Text('Product berhasil ditambahkan')));

      Navigator.pushReplacementNamed(context, Routes.main).then(
        (_) => Navigator.pop(context),
      );
    }
  }

  Future<void> addToFav(productId, userId) async {
    final productRef = MyCollection.product.doc(productId);
    final userRef = MyCollection.user.doc(userId);

    await productRef.update({
      "userProductFav": FieldValue.arrayUnion([userId])
    });
    await userRef.update({
      "productUserFav": FieldValue.arrayUnion([productId])
    });
  }

  Future<void> removefromFav(productId, userId) async {
    final productRef = MyCollection.product.doc(productId);
    final userRef = MyCollection.user.doc(userId);

    await productRef.update({
      "userProductFav": FieldValue.arrayRemove([userId])
    });
    await userRef.update({
      "productUserFav": FieldValue.arrayRemove([productId])
    });
  }

  Future<ProductModel> getProductById(String prodId) async {
    final data = await MyCollection.product.doc(prodId).get();
    return ProductModel.fromJson(data.data() as Map<String, dynamic>);
  }

  Future<dynamic> getNotReviewdProductById(prodId, userId) async {
    final data = await MyCollection.product.doc(prodId).get();

    Map<String, dynamic> pe = data.data() as Map<String, dynamic>;
    List<dynamic> ya = pe["userAlreadyReview"];

    if (ya.contains(userId)) {
      return;
    }

    return ProductModel.fromJson(data.data() as Map<String, dynamic>);
  }

  Future<void> productReviewed(productId, userId) async {
    final productRef = MyCollection.product.doc(productId);
    var snapshot = await productRef.get();
    List productData = snapshot.data()!["userAlreadyReview"];

    if (!productData.contains(userId)) {
      productRef.update({
        "userAlreadyReview": FieldValue.arrayUnion([userId])
      });
    }
  }
}
