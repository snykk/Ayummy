import 'package:flutter/material.dart';
import 'package:project/app/views/auth/widgets/custom_input.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';
import 'package:project/app/views/main/profile/widgets/option_card.dart';

class Bantuan extends StatelessWidget {
  const Bantuan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final TextEditingController bantuanC = TextEditingController();

    return Scaffold(
      appBar: const CustomAppbar(text:"Bantuan", child: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40,right: 45,left: 45),
          child: Column(
            children: [
              CustomInput(
                controller: bantuanC,
                keyboardType: TextInputType.name, 
                text: "Cari Bantuan ...", 
                obscureText: false, 
                inputFormatters: null, 
                customIconData: Icons.search_outlined,
              ),
              const SizedBox(height: 30,),
              const OptionCard(text: Text("Pengunduhan & Pemasangan")),
              const SizedBox(height: 10,),
              const OptionCard(text: Text("Akun & profil")),
              const SizedBox(height: 10,),
              const OptionCard(text: Text("Chat")),
              const SizedBox(height: 10,),
              const OptionCard(text: Text("Pembayaran")),
              const SizedBox(height: 10,),
              const OptionCard(text: Text("Keamanan & Privasi")),
              const SizedBox(height: 10,),
            ],
          )
        ),
      ),
    );
  }
}