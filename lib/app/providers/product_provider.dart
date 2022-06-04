import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

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
}
