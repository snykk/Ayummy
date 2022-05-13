import 'package:flutter/material.dart';
import 'package:project/app/views/main/promo/widgets/card_promo.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';

class Promo extends StatelessWidget {
  const Promo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        text: "Promo",
        child: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(
            top: 40,
            left: MediaQuery.of(context).size.width * 0.110,
            right: MediaQuery.of(context).size.width * 0.110),
        child: Column(
          children: const [
            CardPromo(promo: "Potongan 10%", detail: "sampai 02 maret 2022",),
            SizedBox(height: 25,),
            CardPromo(promo: "Cashback 5.000", detail: "sampai 04 maret 2022",),
            SizedBox(height: 25,),
            CardPromo(promo: "Potongan 30%", detail: "sampai 05 maret 2022",),
          ],
        ),
      ),
    );
  }
}

