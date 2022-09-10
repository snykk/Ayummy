import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/app/constants/collection.dart';
import 'package:project/app/constants/palettes.dart';
import 'package:project/app/providers/user_provider.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../../../constants/ratio.dart';
import '../../../models/cart_model.dart';
import '../../../models/product_model.dart';
import '../../../providers/cart_provider.dart';
import '../../../providers/order_provider.dart';
import '../../../providers/product_provider.dart';

enum SingingCharacter { langsung, gopay, dana }

class Pembayaran extends StatefulWidget {
  const Pembayaran({Key? key}) : super(key: key);

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  Future<void> _dialogConfirmation(context, data) async {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
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
                  MyPalettes.appOrange,
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
                  MyPalettes.appOrange,
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
                      await MyCollection.cart.doc(item["id"]).delete();

                      ProductModel productData =
                          await productProvider.getProductById(item["productId"]);
                      await MyCollection.product.doc(item["productId"]).update({
                        "qty": productData.qty - item["qty"],
                        "sold": productData.sold + item["qty"],
                      });
                    }
                    cartProvider.paymentMethod = "COD";
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
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
                              future: productProvider.getProductById(cartItem.productId),
                              builder: (_, snapProduct) {
                                if (snapProduct.connectionState == ConnectionState.waiting) {
                                  return Center(
                                    child: Container(),
                                  );
                                }
                                final productData = snapProduct.data!;
                                final totalPerItem = cartItem.qty * productData.price;

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
                                          color: MyPalettes.appOrange,
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
                      vertical: Ratio(context).heightApp * 0.009,
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
                          color: MyPalettes.appOrange,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                        activeColor: MyPalettes.appOrange,
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
                        activeColor: MyPalettes.appOrange,
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
                        activeColor: MyPalettes.appOrange,
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
