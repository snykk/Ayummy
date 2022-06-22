import 'package:flutter/material.dart';

class PembayaranBerhasil extends StatelessWidget {
  const PembayaranBerhasil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(children: [
          const SizedBox(
            height: 0,
          ),
          const Spacer(),
          Column(
            children: const [
              Image(image: AssetImage("./assets/pembayaran/success.png")),
              SizedBox(height: 25),
              Text("Pembayaran Berhasil",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/main');
            },
            child: Ink(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff2f4858),
              ),
              child: const Center(
                child: Text(
                  "Kembali",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
