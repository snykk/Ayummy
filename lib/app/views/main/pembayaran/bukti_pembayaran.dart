import 'package:flutter/material.dart';

class BuktiPembayaran extends StatelessWidget {
  const BuktiPembayaran({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const SizedBox(height: 0,),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 25
              ),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFFF8A00)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
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
                      Text("4. Ayam Bakar Madu x2", style: TextStyle(fontSize: 16)),
                      Spacer(),
                      Text("26.000", style: TextStyle(fontSize: 16, color: Color(0xFFFF8A00)))
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Text("5. Ayam Bakar Madu x2", style: TextStyle(fontSize: 16)),
                      Spacer(),
                      Text("26.000", style: TextStyle(fontSize: 16, color: Color(0xFFFF8A00)))
                    ],
                  ),
                  const SizedBox(height: 28),
                  Container(
                    height: 2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff2f4858)),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Total", style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF8A00),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text("63.500", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                      )
                    ],
                  )
                ],
              ),
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
                        "Selanjutnya",
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