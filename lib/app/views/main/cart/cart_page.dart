import 'dart:developer';

import "package:flutter/material.dart";
import 'package:project/app/providers/cart_provider.dart';
import 'package:project/app/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/cart_model.dart';
import '../../../models/product_model.dart';
import '../../../providers/user_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    log("restart");
    final userProvider = Provider.of<UserProvider>(context, listen: false).getUser;
    final productProvider = Provider.of<ProductProvider>(context, listen: false);

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.075,
          MediaQuery.of(context).size.width * 0.08,
          MediaQuery.of(context).size.width * 0.075,
          MediaQuery.of(context).size.width * 0.075,
        ),
        child: Column(
          children: [
            Flexible(
              child: ListView(
                children: [
                  FutureBuilder(
                    future: cartProvider.setCartUser(userProvider.id),
                    builder: (context, snapCart) {
                      if (snapCart.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

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
                                } else if (snapProduct.connectionState == ConnectionState.done) {
                                  final productData = snapProduct.data!;

                                  return ChangeNotifierProvider.value(
                                    value: cartItem,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context).size.height * 0.002),
                                      child: Card(
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
                                                    child: Image(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(productData.imageUrl),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 120,
                                                  height: double.infinity,
                                                  child: Center(
                                                    child: Text(
                                                      productData.name,
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 90,
                                                  height: double.infinity,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          if (cartItem.qty > 1) {
                                                            await cartProvider.decItemCart(
                                                                cartItem.id,
                                                                cartItem.qty,
                                                                cartItem.productId,
                                                                productData.price);
                                                            cartItem.changeQty = -1;
                                                          } else {
                                                            await cartProvider
                                                                .removeItemFromCart(
                                                                    cartItem.id, productData.price)
                                                                .then((_) {
                                                              setState(() {});
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 25,
                                                          height: 25,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(5),
                                                              border: Border.all(
                                                                  color: const Color(0xff2f4858),
                                                                  width: 2.0)),
                                                          child: const Icon(
                                                            Icons.remove,
                                                            size: 20,
                                                            color: Color(0xff2f4858),
                                                          ),
                                                        ),
                                                      ),
                                                      Consumer<CartModel>(
                                                        builder: (_, __, ___) => SizedBox(
                                                          width: 25,
                                                          height: 25,
                                                          child: Center(
                                                            child: Text(
                                                              cartItem.qty.toString(),
                                                              style: const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xff2f4858),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          await cartProvider.incItemCart(
                                                              cartItem.id,
                                                              cartItem.qty,
                                                              productData.price);
                                                          cartItem.changeQty = 1;
                                                        },
                                                        child: Container(
                                                          width: 25,
                                                          height: 25,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(5),
                                                              border: Border.all(
                                                                  color: const Color(0xff2f4858),
                                                                  width: 2.0)),
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
                                    ),
                                  );
                                }
                                return Container();
                              },
                            )
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, top: 0),
              child: InkWell(
                onTap: () async {
                  await cartProvider.setTotalHarga();

                  if (cartProvider.totalHarga != 0) {
                    Navigator.pushNamed(context, '/pembayaran');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Keranjang kosong, tidak dapat melakukan checkout'),
                      ),
                    );
                  }
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
