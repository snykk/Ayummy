import 'package:flutter/material.dart';
import 'package:project/app/views/auth/widgets/custom_input.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';
import 'package:project/app/views/main/profile/widgets/option_card.dart';

class Bantuan extends StatelessWidget {
  const Bantuan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(text:"Bantuan", child: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40,right: 45,left: 45),
          child: Column(
            children: const [
              CustomInput(
                keyboardType: TextInputType.name, 
                text: "Cari Bantuan ...", 
                obscureText: false, 
                inputFormatters: null, 
                customIconData: Icons.search_outlined,
              ),
              SizedBox(height: 30,),
              OptionCard(text: Text("Pengunduhan & Pemasangan")),
              SizedBox(height: 10,),
              OptionCard(text: Text("Akun & profil")),
              SizedBox(height: 10,),
              OptionCard(text: Text("Chat")),
              SizedBox(height: 10,),
              OptionCard(text: Text("Pembayaran")),
              SizedBox(height: 10,),
              OptionCard(text: Text("Keamanan & Privasi")),
              SizedBox(height: 10,),
            ],
          )
        ),
      ),
    );
  }
}