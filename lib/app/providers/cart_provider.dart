
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _allCarts = [];

  Future<void> setAllCart() async {
    final data = await FirebaseFirestore.instance.collection("cart").get();

    _allCarts = <CartModel>[
      for (QueryDocumentSnapshot<Object?> item in data.docs) CartModel.fromJson(item.data() as Map<String,dynamic>)
    ];
  }

  List<CartModel> get getAllCart {
    return [..._allCarts];
  }

  Future<void> addCart({
      BuildContext? context,
      required String productId,
      required String productName,
      required int qty,
      required int productPrice,
    }) async {
    QuerySnapshot<Object?> cart = await FirebaseFirestore.instance.collection("cart").where("productName", isEqualTo: productName).get();
    
    final newCart = FirebaseFirestore.instance.collection("cart").doc();
    if (cart.docs.isEmpty) {
      await newCart.set(
        CartModel(
          id: newCart.id,
          productId: productId,
          productName: productName,
          qty: qty,
          productPrice: productPrice,
        ).toJson(),
      );
    }
  }
}