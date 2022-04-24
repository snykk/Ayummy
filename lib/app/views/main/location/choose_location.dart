import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 140,
            color: const Color.fromRGBO(255, 147, 18, 1),
            padding: const EdgeInsets.fromLTRB(24, 40, 0, 0),
            child: Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.white,
                  size: 33,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 68),
                child: const Text(
                  "Pilih Lokasi",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ]),
          ),
          Container(
            height: 500,
            width: 500,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/map/Peta_1.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Container(
              alignment: Alignment.topCenter,
              width: 320,
              height: 56,
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(),
                    ),
                    hintText: 'Pilih Lokasi ...',
                    prefixIcon: const Icon(Icons.search)),
              ),
            ),
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
                "Simpan Alamat",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
