import 'package:flutter/material.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';
import 'package:project/app/views/main/profile/widgets/option_card.dart';

import '../../../routes/route.dart';

class Pengaturan extends StatelessWidget {
  const Pengaturan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        text: "Pengaturan",
        child: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(top: 40, right: 45, left: 45),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.bantuan);
                  },
                  child: const OptionCard(text: Text("Bantuan")),
                ),
                const OptionCard(text: Text("Notifikasi")),
                const SizedBox(
                  height: 10,
                ),
                const OptionCard(text: Text("Bahasa")),
                const SizedBox(
                  height: 10,
                ),
                const OptionCard(text: Text("Akun")),
                const SizedBox(
                  height: 10,
                ),
                const OptionCard(text: Text("Undah Teman")),
                const SizedBox(
                  height: 10,
                ),
                const OptionCard(text: Text("Versi Aplikasi")),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
      ),
    );
  }
}
