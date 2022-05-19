// ignore_for_file: avoid_print

import "package:flutter/material.dart";
import 'package:project/app/providers/product_provider.dart';
import 'package:provider/provider.dart';

class DetailMenuPage extends StatelessWidget {
  const DetailMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final product = Provider.of<ProductProvider>(context).findById(productId);

    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
          Container(
            width: double.infinity,
            height: 180,
            color: const Color(0xffff8a00),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 340,
                height: 720,
                // color: const Color.fromRGBO(0, 0, 0, 0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        const Text(
                          "Detail Menu",
                          style: TextStyle(fontSize: 23, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            print(product.isFav);
                            product.toggleFav();
                            print(product.isFav);
                          },
                          icon: Icon(
                            (product.isFav)
                                ? Icons.favorite
                                : Icons.favorite_outline_outlined,
                            color: Colors.white,
                            size: 33,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          product.imageUrl,
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.26,
                          fit: BoxFit.fill,
                        ),
                      ),
                      elevation: 5,
                      shadowColor: Colors.black,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            product.name,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          product.price,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${product.sold} terjual",
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Deksripsi",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      product.description.split("pemisah_ehe")[0],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      product.description.split("pemisah_ehe")[1],
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            print("not yet");
                          },
                          child: Container(
                            width: 265,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff2f4858),
                            ),
                            child: const Center(
                              child: Text(
                                "Pesan Sekarang",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print("menyusul ygy");
                          },
                          child: Container(
                            width: 60,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff2f4858),
                            ),
                            child: const Icon(
                              Icons.message_outlined,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
