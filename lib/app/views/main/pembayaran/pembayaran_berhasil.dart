import 'package:flutter/material.dart';
import 'package:project/app/views/main/profile/riwayat_pemesanan.dart';

class PembayaranBerHasil extends StatelessWidget {
  const PembayaranBerHasil({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BelajarFlutter.com'),
      ),
      body: Column(
        children: const [
        Content(),
        Spacer(),
        Button()],)
      );
  }
}

class Content extends StatelessWidget {
  const Content({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          const Image(image: AssetImage('assets/icon/success.png')),
          Container(
            margin: const EdgeInsets.only(top: 28.0),
            child: const Text('Pembayaran Berhasil',  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
        ]
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.bottomCenter, child: Padding(
        padding: const EdgeInsets.all(30),
        child: ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const RiwayatPemesanan();
          }));
        },
        style: ElevatedButton.styleFrom(
          primary: const Color(0XFF2F4858),
          minimumSize: const Size(250, 60), // Background color
        ),
        child: const Text("Selanjutnya", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),),
    ));
  }
}