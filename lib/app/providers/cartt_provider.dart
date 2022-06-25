import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/cartt_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _cartData = [];
  int totalHarga = 0;
  String paymentMethod = "COD";

  Future<void> setCartUser(String userId) async {
    final cartRef = await FirebaseFirestore.instance
        .collection("cart")
        .where("userId", isEqualTo: userId)
        .get();

    _cartData = <CartModel>[
      for (QueryDocumentSnapshot<Object?> item in cartRef.docs)
        CartModel.fromJson(item.data() as Map<String, dynamic>)
    ];

    notifyListeners();
  }

  List<CartModel> get getCartData => _cartData;

  Future<void> addToCart({
    required BuildContext context,
    required String userId,
    required String productId,
  }) async {
    isCartReady(productId: productId, userId: userId).then((data) async {
      if (data.isNotEmpty) {
        FirebaseFirestore.instance.collection("cart").doc(data["id"]).update(
          {
            "qty": 1 + data["qty"] as int,
          },
        );
      } else {
        final cart = FirebaseFirestore.instance.collection("cart").doc();
        await cart.set(
          CartModel(
            id: cart.id,
            userId: userId,
            productId: productId,
            qty: 1,
          ).toJson(),
        );
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Produk berhasil ditambahkan ke keranjang'),
        ),
      );
    });
  }

  Future<Map<String, dynamic>> isCartReady({
    required String productId,
    required String userId,
  }) async {
    final data = await FirebaseFirestore.instance
        .collection("cart")
        .where("productId", isEqualTo: productId)
        .where("userId", isEqualTo: userId)
        .get();

    if (data.docs.isNotEmpty) {
      return {
        "id": data.docs.first.id,
        "qty": data.docs.first["qty"],
      };
    }

    return {};
  }

  Future<void> incItemCart(cartId, cartQty, productPrice) async {
    await FirebaseFirestore.instance.collection("cart").doc(cartId).update(
      {"qty": cartQty + 1},
    );
  }

  Future<void> decItemCart(cartId, cartQty, productId, productPrice) async {
    await FirebaseFirestore.instance.collection("cart").doc(cartId).update(
      {"qty": cartQty - 1},
    );
  }

  Future<void> removeItemFromCart(cartId, productPrice) async {
    await FirebaseFirestore.instance.collection("cart").doc(cartId).delete();
    _cartData.removeWhere((item) => item.id == cartId);

    notifyListeners();
  }

  Future<void> setTotalHarga() async {
    totalHarga = 0;
    for (CartModel cartItem in _cartData) {
      final productRef =
          await FirebaseFirestore.instance.collection("product").doc(cartItem.productId).get();
      totalHarga += cartItem.qty * productRef["price"] as int;
    }
  }

  changePaymentMethod(payment) {
    paymentMethod = payment;
    notifyListeners();
  }
}
