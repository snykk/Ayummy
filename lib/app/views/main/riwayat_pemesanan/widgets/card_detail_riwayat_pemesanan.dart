import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/app/constants/palettes.dart';

import '../../../../constants/ratio.dart';

class CardDetailRiwayatPemesanan extends StatelessWidget {
  final String image;
  final int quantity;
  final String food;
  final int price;
  final String date;
  const CardDetailRiwayatPemesanan(
      {Key? key,
      required this.image,
      required this.quantity,
      required this.food,
      required this.price,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myCurr = NumberFormat("#,##0", "en_US");

    return Card(
      child: SizedBox(
        height: Ratio(context).heightApp * 0.125,
        width: Ratio(context).widthApp * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 85,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(image),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(bottom: 3),
                    width: 205,
                    height: 30,
                    child: Text(
                      food + " x " + quantity.toString(),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 205,
                    height: 45,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                myCurr.format(price.toInt()),
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                date,
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: MyPalettes.appOrange,
                          ),
                          child: const Center(
                            child: Text(
                              "Beli lagi",
                              style: TextStyle(fontSize: 11, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      elevation: 6,
      shadowColor: const Color.fromRGBO(255, 255, 255, 50),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 1)),
    );
  }
}
