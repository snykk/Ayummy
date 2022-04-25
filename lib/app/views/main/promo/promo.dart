import 'package:flutter/material.dart';

void main() {
  runApp(const promo());
}

class promo extends StatelessWidget {
  const promo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halaman Promo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'promo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          leading: Icon(Icons.arrow_back, color: Colors.white),
          title: Text('Promo', style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: 0.05),
            //BOX PERTAMA
            Container(
                // margin: EdgeInsets.only(top: 4),
                height: 100,
                child: Stack(
                  children: [
                    Positioned(
                        top: 35,
                        left: 20,
                        child: Material(
                          child: Container(
                            height: 100.0,
                            width: 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: Offset(-10.0, 10.0),
                                    blurRadius: 20.0,
                                    spreadRadius: 4.0)
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                        top: 20,
                        left: 30,
                        child: Card(
                          elevation: 10.0, //beri ukuran shadow
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 70,
                            width: 280,
                            child: FittedBox(
                              alignment: Alignment.centerLeft,
                              child: (Image.asset('assets/images/Ticket.png',
                                  height: 15, width: 10)),
                            ),
                          ),
                        )),
                    Positioned(
                        top: 40,
                        left: 90,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Potongan 10%',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'sampai 2 Maret 2022',
                                style: TextStyle(
                                    wordSpacing: 2,
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ))
                  ],
                )),
            //BOX KEDUA
            Container(
                // margin: EdgeInsets.only(top: 4),
                height: 100,
                child: Stack(
                  children: [
                    Positioned(
                        top: 35,
                        left: 20,
                        child: Material(
                          child: Container(
                            height: 100.0,
                            width: 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: Offset(-10.0, 10.0),
                                    blurRadius: 20.0,
                                    spreadRadius: 4.0)
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                        top: 20,
                        left: 30,
                        child: Card(
                          elevation: 10.0, //beri ukuran shadow
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 70,
                            width: 280,
                            child: FittedBox(
                              alignment: Alignment.centerLeft,
                              child: (Image.asset('assets/images/Ticket.png',
                                  height: 15, width: 10)),
                            ),
                          ),
                        )),
                    Positioned(
                        top: 40,
                        left: 90,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Chasback 5.000',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'sampai 4 maret 2022',
                                style: TextStyle(
                                    wordSpacing: 2,
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ))
                  ],
                ))
          ],
        ));
  }
}
