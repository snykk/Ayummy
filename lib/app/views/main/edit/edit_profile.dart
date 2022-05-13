import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/app/views/main/edit/widgets/custom_input.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';

class UbahProfile extends StatelessWidget {
  const UbahProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(text: "Ubah Data", child: true),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          const CustomInput(
            title: "Nama",
            keyboardType: TextInputType.name,
            placeholder: "Patrick Star 7",
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomInput(
            title: "Email",
            keyboardType: TextInputType.name,
            placeholder: "patrickstar7@gmail.com",
          ),
          const SizedBox(
            height: 16,
          ),
          CustomInput(
            title: "No. HP",
            keyboardType: TextInputType.number,
            placeholder: "+628 1982 7741",
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          CustomInput(
            title: "No. HP",
            keyboardType: TextInputType.multiline,
            placeholder:
                "Kpg. Bambu No. 963, Administrasi Jakarta Pusat 80412, SumSe",
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            maxLines: 4,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.topLeft,
            child: const Text(
              " ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 350,
            height: 150,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )),
              onPressed: () {
                Navigator.pushNamed(context, "/pilih_lokasi");
              },
              child: const Text(
                " ",
                style: TextStyle(color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                    image: AssetImage('assets/map/Peta_2.png'),
                    fit: BoxFit.fill),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black87,
                    spreadRadius: 0.5,
                  ),
                ]),
          ),
          SizedBox(
            width: 300,
            height: 64,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(47, 72, 88, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )),
              onPressed: () {},
              child: const Text(
                "Simpan",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}


