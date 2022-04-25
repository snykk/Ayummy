import 'package:flutter/material.dart';
import 'package:project/app/views/main/not_reviewed/widgets/card_belum_diulas.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';

class BelumDiulas extends StatelessWidget {
  const BelumDiulas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        text: "Belum diulas",
        child: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const  <Widget>[
            SizedBox(
              height: 48,
            ),
            CardBelumDiulas(image: "assets/makanan/ayam_bakar_rica.jpg", food: "Ayam Bakar Rica",),
            CardBelumDiulas(image: "assets/makanan/ayam_geprek.jpg", food: "Ayam Geprek Bawang",),
            CardBelumDiulas(image: "assets/makanan/ayam_crispy.jpg", food: "Ayam Crispy Sambal",),
            CardBelumDiulas(image: "assets/makanan/ayam_bakar_madu.jpg", food: "Ayam Bakar Madu",),
          ],
        ),
      ),
    );
  }
}

