import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/app/models/orderr_model.dart';
import 'package:project/app/providers/product_provider.dart';
import 'package:project/app/views/main/riwayat_pemesanan/widgets/card_detail_riwayat_pemesanan.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';

class DetailRiwayatPemesanan extends StatelessWidget {
  const DetailRiwayatPemesanan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderModel>(context, listen: false);
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    final myCurr = NumberFormat("#,##0", "en_US");

    return Scaffold(
      appBar: const CustomAppbar(
        text: "Detail Riwayat Pemesanan",
        child: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(
              top: 30,
              right: MediaQuery.of(context).size.width * 0.1,
              left: MediaQuery.of(context).size.width * 0.1),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total pemesanan : ",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Rp. ${myCurr.format(order.totalPrice)}",
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(),
                for (Map<String, dynamic> item in order.orderDetails)
                  FutureBuilder<ProductModel>(
                    future: productProvider.getProductById(item["productId"]),
                    builder: (_, snapProduct) {
                      if (snapProduct.connectionState == ConnectionState.waiting) {
                        return Container();
                      }

                      var dataProduct = snapProduct.data!;

                      return CardDetailRiwayatPemesanan(
                        image: dataProduct.imageUrl,
                        quantity: item["qty"],
                        food: dataProduct.name,
                        price: item["qty"] * dataProduct.price,
                        date: DateFormat('dd MMM yyyy').format(order.createAt),
                      );
                    },
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
