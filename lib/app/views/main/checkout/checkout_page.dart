// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:project/app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).setAllCart().then((_) => setState(() {}));
    final allCart = Provider.of<CartProvider>(context, listen: false).getAllCart;
        
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width *0.075,
            MediaQuery.of(context).size.width *0.08,
            MediaQuery.of(context).size.width *0.075,
            MediaQuery.of(context).size.width *0.075,
          ),
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: allCart.length,
                  itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                      value: allCart[i],
                      child: Column(
                        children: <Widget>[
                          // StreamBuilder(builder: builder)
                          Card(
                            child: SizedBox(
                              height: 100,
                              // width: double.infinity,
                              child: Center(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 85,
                                      height: double.infinity,
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: const Image(
                                          fit: BoxFit.fill,
                                          image: AssetImage("assets/makanan/ayam_bakar_rica.jpg"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 120,
                                      height: double.infinity,
                                      child: Center(
                                        child: Text(
                                          allCart[i].productName,
                                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 90,
                                      height: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              final docCart = FirebaseFirestore.instance.collection('cart').doc(allCart[i].id);
                                              if (allCart[i].qty == 1) {
                                                docCart.delete();
                                              } else {
                                                docCart.update({
                                                  'qty': allCart[i].qty - 1
                                                });
                                              }
                                            },
                                            child: Container(
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: const Color(0xff2f4858), width: 2.0)),
                                              child: const Icon(
                                                Icons.remove,
                                                size: 20,
                                                color: Color(0xff2f4858),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 25,
                                            height: 25,
                                            child: Center(
                                              child: Text(
                                                allCart[i].qty.toString(),
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff2f4858),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              final docCart = FirebaseFirestore.instance.collection('cart').doc(allCart[i].id);
                                              docCart.update({
                                                'qty': allCart[i].qty + 1
                                              });
                                            },
                                            child: Container(
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: const Color(0xff2f4858), width: 2.0)),
                                              child: const Icon(
                                                Icons.add,
                                                size: 20,
                                                color: Color(0xff2f4858),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                          height: 5,
                        ),
                        ],
                      ),
                    ),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/pembayaran');
                  },
                  child: Ink(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff2f4858),
                    ),
                    child: const Center(
                      child: Text(
                        "Checkout Sekarang",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
