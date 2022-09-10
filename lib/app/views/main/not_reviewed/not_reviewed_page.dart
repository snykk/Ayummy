import 'package:flutter/material.dart';
import 'package:project/app/providers/order_provider.dart';
import 'package:project/app/providers/product_provider.dart';
import 'package:project/app/providers/user_provider.dart';
import 'package:project/app/views/main/not_reviewed/widgets/card_belum_diulas.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../../../constants/ratio.dart';
import '../../../models/product_model.dart';

class BelumDiulas extends StatelessWidget {
  const BelumDiulas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final productProvider = Provider.of<ProductProvider>(context, listen: false);

    return Scaffold(
      appBar: const CustomAppbar(
        text: "Belum diulas",
        child: true,
      ),
      body: FutureBuilder(
        future: orderProvider.setOrderedProduct(userProvider.getUser.id),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Container();
          }

          return ListView(
            children: [
              SizedBox(
                height: Ratio(context).heightApp * 0.04,
              ),
              for (String productId in orderProvider.getAllOrderedProduct)
                FutureBuilder<dynamic>(
                  future:
                      productProvider.getNotReviewdProductById(productId, userProvider.getUser.id),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return Container();
                    }

                    if (snap.data == null) {
                      return Container();
                    }

                    ProductModel productData = snap.data!;
                    return CardBelumDiulas(
                      id: productData.id,
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
