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
            margin: const EdgeInsets.only(bottom: 48),
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
                margin: const EdgeInsets.only(left: 51),
                child: const Text(
                  "Belum di ulas",
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
            margin: const EdgeInsets.fromLTRB(47, 0, 47, 24),
            width: 320,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset.fromDirection(-15, -5),
                  ),
                ]),
            child: Row(children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/makanan/ayam_bakar_rica_2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: const Text(
                      "Ayam Bakar Rica",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 50, 0),
                    width: 87,
                    height: 29,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(255, 147, 18, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          )),
                      onPressed: () {},
                      child: const Text(
                        "Beri Rating",
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(47, 0, 47, 0),
            width: 320,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset.fromDirection(-15, -5),
                  ),
                ]),
            child: Row(children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/makanan/ayam_geprek.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: const Text(
                      "Ayam Geprek Bawang",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 90, 0),
                    width: 87,
                    height: 29,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(255, 147, 18, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          )),
                      onPressed: () {},
                      child: const Text(
                        "Beri Rating",
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(47, 24, 47, 0),
            width: 320,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset.fromDirection(-15, -5),
                  ),
                ]),
            child: Row(children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/makanan/ayam_crispy.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: const Text(
                      "Ayam Crispy Sambal",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 80, 0),
                    width: 87,
                    height: 29,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(255, 147, 18, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          )),
                      onPressed: () {},
                      child: const Text(
                        "Beri Rating",
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(47, 24, 47, 0),
            width: 320,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset.fromDirection(-15, -5),
                  ),
                ]),
            child: Row(children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/makanan/ayam_bakar_madu.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: const Text(
                      "Ayam Bakar Madu",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 60, 0),
                    width: 87,
                    height: 29,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(255, 147, 18, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          )),
                      onPressed: () {},
                      child: const Text(
                        "Beri Rating",
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ])),
      ),
    );
  }
}
