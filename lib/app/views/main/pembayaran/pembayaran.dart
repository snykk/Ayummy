import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/app/providers/user_provider.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../../../models/cartt_model.dart';
import '../../../models/product_model.dart';
import '../../../providers/cartt_provider.dart';
import '../../../providers/orderr_provider.dart';
import '../../../providers/product_provider.dart';

enum SingingCharacter { langsung, gopay, dana }

class Pembayaran extends StatefulWidget {
  const Pembayaran({Key? key}) : super(key: key);

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  // SingingCharacter? _character = SingingCharacter.langsung;
  Future<void> _dialogConfirmation(context, data) async {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Sistem'),
          content: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                Text('Apakah anda yakin ingin mengakhiri pemesanan?'),
              ],
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  const Color(0x15ff8a00),
                ),
                foregroundColor: MaterialStateProperty.all(
                  const Color(0xffff8a00),
                ),
              ),
              child: const Text('Batalkan'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  const Color(0x15ff8a00),
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xffff8a00),
                ),
              ),
              child: const Text('Akhiri'),
              onPressed: () async {
                orderProvider
                    .addOrder(
                  context: context,
                  userId: userProvider.getUser.id,
                  paymentMethod: cartProvider.paymentMethod,
                  orderDetails: data,
                  totalPrice: cartProvider.totalHarga,
                )
                    .then(
                  (_) async {
                    for (Map<String, dynamic> item in data) {
                      await FirebaseFirestore.instance
                          .collection("cart")
                          .doc(item["id"])
                          .delete();

                      ProductModel productData = await productProvider
                          .getProductById(item["productId"]);
                      await FirebaseFirestore.instance
                          .collection("product")
                          .doc(item["productId"])
                          .update({
                        "qty": productData.qty - item["qty"],
                        "sold": productData.sold + item["qty"],
                      });
                    }
                    cartProvider.paymentMethod = "COD";
                  },
                );

                // orderProvider.addOrder(paymentMethod: paymentMethod, details: details, totalPrice: totalPrice)
                // Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final userProvider =
    //     Provider.of<UserProvider>(context, listen: false).getUser;
    // // final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    // Provider.of<CartProvider>(context, listen: false)
    //     .setAllCart()
    //     .then((_) => setState(() {}));
    // final allCart =
    //     Provider.of<CartProvider>(context, listen: false).getAllCart;

    // List<dynamic> payment = (_character.toString()).split('.');

    // int sum = 0;

    // for (var i = 0; i < userProvider.cart.length; i++) {
    //   sum += allCart[i].productPrice! * allCart[i].qty;
    // }

    // List carts = [];

    // for (var i = 0; i < allCart.length; i++) {
    //   carts.add(
    //     {
    //       "id": allCart[i].id,
    //       "productName": allCart[i].productName,
    //       "qty": allCart[i].qty,
    //       "producPrice": allCart[i].productPrice,
    //     },
    //   );
    // }

    // List<dynamic> orders = [];
    // // orders.add("abc");
    // orders.add({
    //   "create_at": DateTime.now(),
    //   "isPayed": false,
    //   "paymentMethod": payment,
    //   "details": carts,
    //   "totalPrice": sum,
    // });

    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final myCurr = NumberFormat("#,##0", "en_US");

    final cartCheckoutList = <Map<String, dynamic>>[];

    return Scaffold(
      appBar: const CustomAppbar(
        text: "Pembayaran",
        child: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              child: Text(
                "Detail Pesanan",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Flexible(
              child: ListView(
                children: [
                  FutureBuilder(
                    future: cartProvider.setCartUser(userProvider.getUser.id),
                    builder: (context, snapCart) {
                      if (snapCart.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      var index = 1;
                      return Column(
                        children: [
                          for (CartModel cartItem in cartProvider.getCartData)
                            FutureBuilder<ProductModel>(
                              future: productProvider
                                  .getProductById(cartItem.productId),
                              builder: (_, snapProduct) {
                                if (snapProduct.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: Container(),
                                  );
                                }
                                final productData = snapProduct.data!;
                                final totalPerItem =
                                    cartItem.qty * productData.price;

                                cartCheckoutList.add(cartItem.toJson());

                                return ChangeNotifierProvider.value(
                                  value: cartItem,
                                  child: Row(
                                    children: [
                                      Text(
                                          (index++).toString() +
                                              '. ' +
                                              productData.name +
                                              ' x' +
                                              cartItem.qty.toString(),
                                          style: const TextStyle(fontSize: 16)),
                                      const Spacer(),
                                      Text(
                                        myCurr.format(totalPerItem),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFFFF8A00),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                        ],
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.009,
                    ),
                    width: double.infinity,
                    height: 2,
                    color: Colors.amber,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "total",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Rp. ${myCurr.format(cartProvider.totalHarga)}",
                        style: const TextStyle(
                          color: Color(0xffff8a00),
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // child: FutureBuilder(
              //   future: cartProvider.setCartUser(userProvider.getUser.id),
              //   builder: (context, snap) {
              //     if (snap.connectionState == ConnectionState.waiting) {
              //       return const Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }

              //     final cartCheckout = cartProvider.getCartData;
              //     return ListView.builder(
              //       shrinkWrap: true,
              //       itemCount: cartCheckout.length,
              //       itemBuilder: (ctx, i) => Column(
              //         children: [
              //           Row(
              //             children: [
              //               Text(
              //                   (i + 1).toString() +
              //                       '. ' +
              //                       "ya" +
              //                       ' x' +
              //                       2.toString(),
              //                   style: const TextStyle(fontSize: 16)),
              //               const Spacer(),
              //               Text(
              //                 (2 * 2).toString(),
              //                 style: const TextStyle(
              //                   fontSize: 16,
              //                   color: Color(0xFFFF8A00),
              //                 ),
              //               )
              //             ],
              //           ),
              //           const SizedBox(height: 8),
              //         ],
              //       ),
              //     );
              //   },
              // ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                "Pembayaran",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Consumer<CartProvider>(
                builder: (context, product, child) => Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('COD'),
                      leading: Radio<String>(
                        activeColor: const Color(0xFFFF8A00),
                        value: "COD",
                        groupValue: cartProvider.paymentMethod,
                        onChanged: (value) {
                          cartProvider.changePaymentMethod(value);
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Gopay'),
                      leading: Radio<String>(
                        activeColor: const Color(0xFFFF8A00),
                        value: "Gopay",
                        groupValue: cartProvider.paymentMethod,
                        onChanged: (value) {
                          cartProvider.changePaymentMethod(value);
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Dana'),
                      leading: Radio<String>(
                        activeColor: const Color(0xFFFF8A00),
                        value: "Dana",
                        groupValue: cartProvider.paymentMethod,
                        onChanged: (value) {
                          cartProvider.changePaymentMethod(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                _dialogConfirmation(context, cartCheckoutList);
                // for (CartModel item in cartCheckoutList) {
                //   print(item.productId);
                // }
                // final docUser = FirebaseFirestore.instance
                //     .collection('user')
                //     .doc(userProvider.id);
                // docUser.update({"order": orders});
                // orderProvider.addOrder(
                //   context: context,
                //   id: "123",
                //   paymentMethod: payment[1],
                //   details: carts,
                //   totalPrice: sum,
                // );
              },
              child: Ink(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 47, 109, 147),
                ),
                child: const Center(
                  child: Text(
                    "Bayar Sekarang",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
