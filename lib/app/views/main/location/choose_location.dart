import 'package:flutter/material.dart';
import 'package:project/app/views/auth/widgets/custom_input.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';


class ChooseLocation extends StatelessWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(text: "Pilih Lokasi", child: true,),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          const SizedBox(height: 30,),
          Container(
            height: 500,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/map/Peta_1.png'),
                  fit: BoxFit.cover),
            ),
            child: Container(
              // alignment: Alignment.topCenter,
              height: 56,
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),

              child: const CustomInput(
                keyboardType: TextInputType.name, 
                text: "Pilih Lokasi",
                customIconData: Icons.search_outlined,
                obscureText: false,
                filled: true,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width *0.675,
            height: 64,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(47, 72, 88, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )),
              onPressed: () {},
              child: const Text(
                "Simpan Alamat",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ])),
      
    );
  }
}
