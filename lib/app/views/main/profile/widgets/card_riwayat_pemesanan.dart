import 'package:flutter/material.dart';

class CardRiwayatPemesanan extends StatelessWidget {
  const CardRiwayatPemesanan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.125,
      width: MediaQuery.of(context).size.width * 0.8,
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
                child: const Image(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/makanan/ayam_bakar_rica.jpg"),
                ),
              ),
            ),
            const SizedBox(width: 10,),
            Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.only(bottom: 3),
                  width: 205,
                  height: 30,
                  child: const Text("Ayam Bakar Rica x ${2}", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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
                          children: const [
                            Text(
                              "23.000",style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                            Text("12/02/2002",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffff8a00),
                        ),
                        child: const Center(
                          child: Text("Beli lagi",style: TextStyle(fontSize: 11, color: Colors.white),),
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
