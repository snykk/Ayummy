import 'package:flutter/material.dart';
import 'package:project/app/models/rating_model.dart';
import 'package:project/app/providers/product_provider.dart';
import 'package:project/app/providers/user_provider.dart';
import 'package:project/app/views/main/telah_diulas/widgets/card_telah_diulas.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';
import '../../../providers/rating_provider.dart';

class TelahDiulas extends StatelessWidget {
  const TelahDiulas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ratingProvider = Provider.of<RatingProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final productProvider = Provider.of<ProductProvider>(context, listen: false);

    return Scaffold(
      appBar: const CustomAppbar(
        text: "Telah diulas",
        child: true,
      ),
      body: FutureBuilder(
        future: ratingProvider.setRatingData(userProvider.getUser.id, userProvider.getUser.roleId),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Container();
          }

          return ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              for (RatingModel item in ratingProvider.getRatingData)
                FutureBuilder<ProductModel>(
                  future: productProvider.getProductById(item.productId),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return Container();
                    }

                    ProductModel productData = snap.data!;
                    return CardTelahDiulas(
                      id: productData.id,
                      ratingId: item.id,
                      rating: item.rating,
                      image: productData.imageUrl,
                      food: productData.name,
                    );
                  },
                )
            ],
          );
        },
      ),
    );
  }
}
