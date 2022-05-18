import 'package:flutter/material.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';
import 'package:project/app/views/main//pembayaran/widgets/metode_pembayaran.dart';

class Pembayaran extends StatelessWidget {
  const Pembayaran({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        text:"Pembayaran",
        child: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: Text("Detail Pesanan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                        Column( children: [
                          Row(
                            children: const [
                              Text("1. Ayam Bakar Madu x2", style: TextStyle(fontSize: 16)),
                              Spacer(),
                              Text("26.000", style: TextStyle(fontSize: 16, color: Color(0xFFFF8A00)))
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: const [
                              Text("2. Ayam Bakar Madu x2", style: TextStyle(fontSize: 16)),
                              Spacer(),
                              Text("26.000", style: TextStyle(fontSize: 16, color: Color(0xFFFF8A00)))
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: const [
                              Text("3. Ayam Bakar Madu x2", style: TextStyle(fontSize: 16)),
                              Spacer(),
                              Text("26.000", style: TextStyle(fontSize: 16, color: Color(0xFFFF8A00)))
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: const [
                              Text("3. Ayam Bakar Madu x2", style: TextStyle(fontSize: 16)),
                              Spacer(),
                              Text("26.000", style: TextStyle(fontSize: 16, color: Color(0xFFFF8A00)))
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: const [
                              Text("3. Ayam Bakar Madu x2", style: TextStyle(fontSize: 16)),
                              Spacer(),
                              Text("26.000", style: TextStyle(fontSize: 16, color: Color(0xFFFF8A00)))
                            ],
                          )
                        ],),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: const Text("Pembayaran", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],),
                        child: const MetodePembayaran(),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/pembayaran_berhasil');
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
                      "Bayar Sekarang",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),)
    );
  }
}


