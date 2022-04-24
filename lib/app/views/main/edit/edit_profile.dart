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
                  "Ubah Data",
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
            margin: const EdgeInsets.fromLTRB(32, 0, 0, 12),
            alignment: Alignment.topLeft,
            child: const Text(
              "Nama",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 350,
            height: 54,
            child: TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(),
                  ),
                  hintText: 'Kukuh Satrio Bimantoro',
                  suffixIcon: const Icon(Icons.edit)),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(32, 16, 0, 12),
            alignment: Alignment.topLeft,
            child: const Text(
              "Email",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 350,
            height: 54,
            child: TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(),
                  ),
                  hintText: 'kukuhsatrio@gmail.com',
                  suffixIcon: const Icon(Icons.edit)),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(32, 16, 0, 12),
            alignment: Alignment.topLeft,
            child: const Text(
              "No. HP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 350,
            height: 54,
            child: TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(),
                  ),
                  hintText: '+628 3544 1789',
                  suffixIcon: const Icon(Icons.edit)),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(32, 16, 0, 12),
            alignment: Alignment.topLeft,
            child: const Text(
              "Alamat",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 350,
            height: 110,
            child: TextFormField(
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(),
                  ),
                  hintText:
                      'Kpg. Bambu No. 963, Administrasi Jakarta Pusat 80412, SumSe',
                  suffixIcon: const Icon(Icons.edit)),
            ),
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
              onPressed: () {},
              child: const Text(
                " ",
                style: TextStyle(color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                    image: AssetImage('assets/map/Peta_2.jpg'),
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
      )),
    );
  }
}
