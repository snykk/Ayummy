import 'package:flutter/material.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';
import 'package:project/app/views/main/profile/widgets/option_card.dart';

class Pengaturan extends StatelessWidget {
  const Pengaturan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(text:"Pengaturan", child: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40,right: 45,left: 45),
          child: Column(
            children: const [
              OptionCard(text: Text("Notifikasi")),
              SizedBox(height: 10,),
              OptionCard(text: Text("Bahasa")),
              SizedBox(height: 10,),
              OptionCard(text: Text("Akun")),
              SizedBox(height: 10,),
              OptionCard(text: Text("Undah Teman")),
              SizedBox(height: 10,),
              OptionCard(text: Text("Versi Aplikasi")),
              SizedBox(height: 10,),
            ],
          )
        ),
      ),
    );
  }
}