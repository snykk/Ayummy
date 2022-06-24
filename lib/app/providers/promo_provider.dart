import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/promo_model.dart';

class PromoProvider with ChangeNotifier {
  List<PromoModel> _allPromos = [];

  Future<void> setAllPromo() async {
    final data = await FirebaseFirestore.instance.collection("promo").get();

    _allPromos = <PromoModel>[
      for (QueryDocumentSnapshot<Object?> item in data.docs)
        PromoModel.fromJson(item.data() as Map<String, dynamic>)
    ];
  }

  List<PromoModel> get getAllPromo => _allPromos;

  Future<void> addProduct({
    BuildContext? context,
    required String name,
    required String categoryId,
    required String detail,
    required List<dynamic> userAlreadyTake,
  }) async {
    QuerySnapshot<Object?> product =
        await FirebaseFirestore.instance.collection("promo").where("name", isEqualTo: name).get();

    final newProduct = FirebaseFirestore.instance.collection("product").doc();
    if (product.docs.isEmpty) {
      await newProduct.set(
        PromoModel(
          id: newProduct.id,
          categoryId: categoryId,
          name: name,
          detail: detail,
          userAlreadyTake: userAlreadyTake,
        ).toJson(),
      );

      ScaffoldMessenger.of(context!)
          .showSnackBar(const SnackBar(content: Text('Product berhasil ditambahkan')));

      Navigator.pushReplacementNamed(context, '/main').then(
        (_) => Navigator.pop(context),
      );
    }
  }

  /*PromoModel(
  name: "Potongan 10%",
  detail: "sampai 02 maret 2022",
  ),
  PromoModel(
  name: "Cashback 5.000",
  detail: "sampai 04 maret 2022",
  ),
  PromoModel(
  name: "Potongan 30%",
  detail: "sampai 05 maret 2022",
  ),

  List<PromoModel> get allpromo {
    return [..._allpromo];
  }*/
}
