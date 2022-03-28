import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            // custom AppBarr
            padding:
                const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 10),
            width: double.infinity,
            height: 200,
            color: const Color.fromARGB(255, 248, 151, 24),
            child: Column(
              children: [
                Row( // selamat datang dan lonceng notif
                  children: [
                    SizedBox(
                      width: 150,
                      child: RichText(
                        text: const TextSpan(
                          text: "Selamat Datang,",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: " Patrick Star",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            )
                          ]
                         ) 
                        ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 170),
                      child: const Icon( 
                        Icons.notifications_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: 800,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Cari Menu",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                    ],
                    )
                ),
              ],
            )),
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 30,
                    width: 110,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 248, 151, 24),
                      border: Border.all(color: const Color.fromARGB(255, 248, 151, 24), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "Semua Menu",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 110,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 248, 151, 24), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "Makanan",
                        style: TextStyle(color: Color.fromARGB(255, 248, 151, 24)),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 110,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 248, 151, 24), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "Minuman",
                        style: TextStyle(color: Color.fromARGB(255, 248, 151, 24)),
                      ),
                    ),
                  )
                ]
                ),
            ),
            SingleChildScrollView(
              child: Container(
                width: 320,
                // color: const Color.fromARGB(255, 50, 255, 255),
                margin: const EdgeInsets.only(top: 13),
                child: Column(// daftar menu
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          child: Container(
                            width: 130,
                            height: 160,
                            decoration: BoxDecoration(
                              // border: Border.all(color: const Color.fromARGB(255, 248, 151, 24), width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: const [
                                SizedBox(
                                  width:  double.infinity,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: AssetImage("assets/makanan/ayam_bakar_rica.jpg"),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Ayam bakar Rica-Rica",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  heightFactor: 2.5,
                                ),
                                Center(
                                  child: Text(
                                    "Rp. 11,500",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        
                              ],
                            ),
                          ),
                          elevation: 8,
                          shadowColor: Colors.black,
                          shape:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:const BorderSide(color: Colors.white,width: 1)
                          ),
                        ),
                        Card(
                          child: Container(
                            width: 130,
                            height: 160,
                            decoration: BoxDecoration(
                              // border: Border.all(color: const Color.fromARGB(255, 248, 151, 24), width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: const [
                                SizedBox(
                                  width:  double.infinity,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: AssetImage("assets/makanan/ayam_bakar_rica.jpg"),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Ayam bakar Rica-Rica",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  heightFactor: 2.5,
                                ),
                                Center(
                                  child: Text(
                                    "Rp. 11,500",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        
                              ],
                            ),
                          ),
                          elevation: 8,
                          shadowColor: Colors.black,
                          shape:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:const BorderSide(color: Colors.white,width: 1)
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          child: Container(
                            width: 130,
                            height: 160,
                            decoration: BoxDecoration(
                              // border: Border.all(color: const Color.fromARGB(255, 248, 151, 24), width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: const [
                                SizedBox(
                                  width:  double.infinity,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: AssetImage("assets/makanan/ayam_bakar_rica.jpg"),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Ayam bakar Rica-Rica",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  heightFactor: 2.5,
                                ),
                                Center(
                                  child: Text(
                                    "Rp. 11,500",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        
                              ],
                            ),
                          ),
                          elevation: 8,
                          shadowColor: Colors.black,
                          shape:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:const BorderSide(color: Colors.white,width: 1)
                          ),
                        ),
                        Card(
                          child: Container(
                            width: 130,
                            height: 160,
                            decoration: BoxDecoration(
                              // border: Border.all(color: const Color.fromARGB(255, 248, 151, 24), width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: const [
                                SizedBox(
                                  width:  double.infinity,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: AssetImage("assets/makanan/ayam_bakar_rica.jpg"),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Ayam bakar Rica-Rica",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  heightFactor: 2.5,
                                ),
                                Center(
                                  child: Text(
                                    "Rp. 11,500",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        
                              ],
                            ),
                          ),
                          elevation: 8,
                          shadowColor: Colors.black,
                          shape:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:const BorderSide(color: Colors.white,width: 1)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
