import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:project/app/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/product_model.dart';
import '../../../providers/user_provider.dart';

class DetailMenuPage extends StatelessWidget {
  const DetailMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false).getUser;
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    final product = Provider.of<ProductModel>(context, listen: false);
    final myCurr = NumberFormat("#,##0", "en_US");


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
                width: MediaQuery.of(context).size.width * 0.825,
                height: MediaQuery.of(context).size.height * 0.95,
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
                        (userProvider.roleId == '1') ?
                        IconButton(
                          onPressed: (){}, 
                          icon: const FaIcon(
                            FontAwesomeIcons.trash,
                            color: Colors.white,
                          ),
                        )
                        :
                        Consumer<ProductModel>(
                          builder: (context, product, child) => IconButton(
                            onPressed: () async {
                              var isContain = product.userProductFav.contains(userProvider.id);
                              if (!isContain) {
                                productProvider.addToFav(product.id, userProvider.id);
                                product.addToFav(userProvider.id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Product berhasil berhasil ditambahkan')));
                              } else {
                                productProvider.remoteToFav(product.id, userProvider.id);
                                product.removeToFav(userProvider.id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Menu favorit dihilangkan dari menu favorit')));
                              }
                            },
                            icon: Icon(product.userProductFav.contains(userProvider.id) ?
                              Icons.favorite : Icons.favorite_outline_outlined,
                                  color: Colors.white,
                                  size: 33,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
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
                          myCurr.format(product.price),
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
