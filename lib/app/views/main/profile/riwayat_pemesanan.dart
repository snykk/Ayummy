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
                CardRiwayatPemesanan(),
                SizedBox(height: 10,),
                CardRiwayatPemesanan(),
                SizedBox(height: 10,),
                CardRiwayatPemesanan(),
                SizedBox(height: 10,),
                CardRiwayatPemesanan(),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

