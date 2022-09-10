import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/app/constants/collection.dart';
import 'package:project/app/models/rating_model.dart';

class RatingProvider with ChangeNotifier {
  List<RatingModel> _ratingData = [];

  Future<void> setRatingData(userId, roleId) async {
    late QuerySnapshot<Map<String, dynamic>> data;
    if (roleId == "1") {
      data = await MyCollection.rating.get();
    } else {
      data = await MyCollection.rating.where("userId", isEqualTo: userId).get();
    }

    _ratingData = <RatingModel>[
      for (QueryDocumentSnapshot<Object?> item in data.docs)
        RatingModel.fromJson(item.data() as Map<String, dynamic>)
    ];
  }

  List<RatingModel> get getRatingData => _ratingData;

  Future<void> addRating({
    BuildContext? context,
    required String productId,
    required String userId,
    required double rating,
  }) async {
    QuerySnapshot<Object?> ratingSnap = await MyCollection.rating
        .where("userId", isEqualTo: userId)
        .where("productId", isEqualTo: productId)
        .get();

    final newRating = MyCollection.rating.doc();
    if (ratingSnap.docs.isEmpty) {
      await newRating.set(
        RatingModel(
          id: newRating.id,
          productId: productId,
          userId: userId,
          rating: rating,
        ).toJson(),
      );

      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(content: Text('Berhasil menambahkan rating')),
      );

      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  Future<void> updateRating(
    BuildContext context,
    String ratingId,
    double ratingValue,
  ) async {
    await MyCollection.rating.doc(ratingId).update(
      {'rating': ratingValue},
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Berhasil mengubah rating')),
    );

    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
