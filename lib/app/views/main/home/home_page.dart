import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:project/app/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';
import '../detail_menu/detail_menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myCurr = NumberFormat("#,##0", "en_US");
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false).getUser;
    return Stack(
      children: [
        FutureBuilder(
            future: productProvider.setAllProduct(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                itemCount: productProvider.getAllProduct.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 8 / 9,
                ),
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: productProvider.getAllProduct[index],
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        // lempar value dari ProductModel ke detail menu page
                        MaterialPageRoute(
                          builder: (context) {
                            return ChangeNotifierProvider.value(
                              value: productProvider.getAllProduct[index],
                              child: const DetailMenuPage(),
                            );
                          },
                        ),
                      ).then((_) {
                        setState(() {});
                      });
                      // Navigator.pushNamed(context, '/detail', arguments: product.id);
                    },
                    child: Card(
                      child: Container(
                        width: 130,
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: Image(
                                  fit: BoxFit.fill,
                                  image:
                                      NetworkImage(productProvider.getAllProduct[index].imageUrl),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                productProvider.getAllProduct[index].name,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              heightFactor: 2.5,
                            ),
                            Center(
                              child: Text(
                                "Rp. ${myCurr.format(productProvider.getAllProduct[index].price)}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      elevation: 8,
                      shadowColor: Colors.black,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white, width: 1)),
                    ),
                  ),
                ),
              );
            }),
        (userProvider.roleId == "1")
            ? Positioned.fill(
                left: MediaQuery.of(context).size.width * 0.75,
                top: MediaQuery.of(context).size.height * 0.5,
                right: MediaQuery.of(context).size.width * 0.10,
                bottom: MediaQuery.of(context).size.height * 0.01,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/tambah_produk").then((value) => setState(() {}));
                  },
                  child: const Icon(
                    Icons.add,
                  ),
                  mini: true,
                  backgroundColor: const Color(0xffff8a00),
                ),
              )
            : Container()
      ],
    );
  }
}
