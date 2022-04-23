import "package:flutter/material.dart";
import 'package:project/app/views/main/profile/widgets/option_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Detail Personal",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "ubah",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffff8a00),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 140,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffff8a00),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/profil/default_avatar.jpg"),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 160,
                              height: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Tretan Muslim Pardede",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  Text(
                                    "tpardede11@gmail.com",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                  Text(
                                    "+628354413913",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 285,
                        height: 1,
                        color: Colors.white,
                      ),
                      const Text(
                        "Kampung Bambu No 963. Administrasi Jakarta Pusat 80412",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const OptionCard(text: Text("Riwayat Pemesanan")),
                const SizedBox(
                  height: 10,
                ),
                const OptionCard(text: Text("Belum diulas")),
                const SizedBox(
                  height: 10,
                ),
                const OptionCard(text: Text("Promo")),
                const SizedBox(
                  height: 10,
                ),
                const OptionCard(text: Text("Bantuan")),
                const SizedBox(
                  height: 10,
                ),
                const OptionCard(text: Text("Pengaturan")),
              ],
            ),
          ),
        )
      ],
    );
  }
}

