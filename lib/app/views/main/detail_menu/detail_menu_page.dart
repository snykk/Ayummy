import "package:flutter/material.dart";
import 'package:project/app/views/main/checkout/checkout_page.dart';

class DetailMenuPage extends StatelessWidget {
  const DetailMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        const Icon(Icons.favorite_outline,
                            color: Colors.white, size: 33),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset("./assets/makanan/ayam_geprek.jpg"),
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
                      children: const [
                        SizedBox(
                          width: 150,
                          child: Text(
                            "Ayam Bakar Maduk",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          "11,500",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "202 terjual",
                      style: TextStyle(
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
                    const Text(
                        "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sed iusto recusandae odio? Cupiditate nemo temporibus alias id, eius eaque amet officia eligendi, vel ipsa iure, laudantium hic sit doloribus excepturi corrupti odit maxime!"),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        "corporis error architecto ipsam possimus! Explicabo eveniet tenetur alias laborum nobis quasi ratione, quaerat, culpa maxime molestias rerum, delectus a reprehenderit provident facere perferendis libero. Ullam cupiditate voluptatem optio"),
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
