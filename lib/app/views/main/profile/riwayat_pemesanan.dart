import 'package:flutter/material.dart';
import 'package:project/app/views/main/profile/widgets/card_riwayat_pemesanan.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';

class RiwayatPemesanan extends StatelessWidget {
  const RiwayatPemesanan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        text:"Riwayat Pemesanan",
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
            child: Column(
              children: const [
                CardRiwayatPemesanan(image: "assets/makanan/ayam_bakar_rica.jpg", quantity: 2, food: "Ayam bakar rica", price: "23.000", date: "12/02/2022"),
                SizedBox(height: 10,),
                CardRiwayatPemesanan(image: "assets/makanan/ayam_geprek.jpg", quantity: 1, food: "Ayam geprek bawah", price: "12.000", date: "14/02/2022"),
                SizedBox(height: 10,),
                CardRiwayatPemesanan(image: "assets/makanan/ayam_crispy.jpg", quantity: 1, food: "Ayam crispy sambal", price: "12.500", date: "15/02/2022"),
                SizedBox(height: 10,),
                CardRiwayatPemesanan(image: "assets/makanan/ayam_bakar_madu.jpg", quantity: 1, food: "Ayam crispy sambal", price: "14.000", date: "18/02/2022"),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

