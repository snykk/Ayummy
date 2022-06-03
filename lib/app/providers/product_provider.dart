import 'package:flutter/foundation.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  final List<ProductModel> _allproducts = [
    ProductModel(
      id: "1",
      name: "Ayam Bakar Madu",
      price: "11,500",
      description:
          "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sed iusto recusandae odio? Cupiditate nemo temporibus alias id, eius eaque amet officia eligendi, vel ipsa iure, laudantium hic sit doloribus excepturi corrupti odit maxime!.pemisah_ehecorporis error architecto ipsam possimus! Explicabo eveniet tenetur alias laborum nobis quasi ratione, quaerat, culpa maxime molestias rerum, delectus a reprehenderit provident facere perferendis libero. Ullam cupiditate voluptatem optio",
      imageUrl: "./assets/makanan/ayam_bakar_madu.jpg",
      sold: 200,
    ),
    ProductModel(
      id: "2",
      name: "Ayam Bakar Rica",
      price: "11,500",
      description:
          "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sed iusto recusandae odio? Cupiditate nemo temporibus alias id, eius eaque amet officia eligendi, vel ipsa iure, laudantium hic sit doloribus excepturi corrupti odit maxime!.pemisah_ehecorporis error architecto ipsam possimus! Explicabo eveniet tenetur alias laborum nobis quasi ratione, quaerat, culpa maxime molestias rerum, delectus a reprehenderit provident facere perferendis libero. Ullam cupiditate voluptatem optio",
      imageUrl: "./assets/makanan/ayam_bakar_rica.jpg",
      sold: 210,
    ),
    ProductModel(
      id: "3",
      name: "Ayam crispy sambal",
      price: "11,500",
      description:
          "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sed iusto recusandae odio? Cupiditate nemo temporibus alias id, eius eaque amet officia eligendi, vel ipsa iure, laudantium hic sit doloribus excepturi corrupti odit maxime!.pemisah_ehecorporis error architecto ipsam possimus! Explicabo eveniet tenetur alias laborum nobis quasi ratione, quaerat, culpa maxime molestias rerum, delectus a reprehenderit provident facere perferendis libero. Ullam cupiditate voluptatem optio",
      imageUrl: "./assets/makanan/ayam_crispy.jpg",
      sold: 210,
    ),
    ProductModel(
      id: "4",
      name: "Ayam geprek bawang",
      price: "11,500",
      description:
          "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sed iusto recusandae odio? Cupiditate nemo temporibus alias id, eius eaque amet officia eligendi, vel ipsa iure, laudantium hic sit doloribus excepturi corrupti odit maxime!.pemisah_ehecorporis error architecto ipsam possimus! Explicabo eveniet tenetur alias laborum nobis quasi ratione, quaerat, culpa maxime molestias rerum, delectus a reprehenderit provident facere perferendis libero. Ullam cupiditate voluptatem optio",
      imageUrl: "./assets/makanan/ayam_geprek.jpg",
      sold: 210,
    ),
    ProductModel(
      id: "5",
      name: "Ayam goreng mentega",
      price: "11,500",
      description:
          "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sed iusto recusandae odio? Cupiditate nemo temporibus alias id, eius eaque amet officia eligendi, vel ipsa iure, laudantium hic sit doloribus excepturi corrupti odit maxime!.pemisah_ehecorporis error architecto ipsam possimus! Explicabo eveniet tenetur alias laborum nobis quasi ratione, quaerat, culpa maxime molestias rerum, delectus a reprehenderit provident facere perferendis libero. Ullam cupiditate voluptatem optio",
      imageUrl: "./assets/makanan/ayam_goreng_mentega.jpg",
      sold: 210,
    ),
    ProductModel(
      id: "6",
      name: "Ayam teriyaki",
      price: "11,500",
      description:
          "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sed iusto recusandae odio? Cupiditate nemo temporibus alias id, eius eaque amet officia eligendi, vel ipsa iure, laudantium hic sit doloribus excepturi corrupti odit maxime!.pemisah_ehecorporis error architecto ipsam possimus! Explicabo eveniet tenetur alias laborum nobis quasi ratione, quaerat, culpa maxime molestias rerum, delectus a reprehenderit provident facere perferendis libero. Ullam cupiditate voluptatem optio",
      imageUrl: "./assets/makanan/ayam_teriyaki.jpeg",
      sold: 210,
    ),
    ProductModel(
      id: "7",
      name: "Ayam pokpok",
      price: "11,500",
      description:
          "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sed iusto recusandae odio? Cupiditate nemo temporibus alias id, eius eaque amet officia eligendi, vel ipsa iure, laudantium hic sit doloribus excepturi corrupti odit maxime!.pemisah_ehecorporis error architecto ipsam possimus! Explicabo eveniet tenetur alias laborum nobis quasi ratione, quaerat, culpa maxime molestias rerum, delectus a reprehenderit provident facere perferendis libero. Ullam cupiditate voluptatem optio",
      imageUrl: "./assets/makanan/ayam_pok_pok.jpg",
      sold: 210,
    ),
  ];

  List<ProductModel> get allproducts {
    return [..._allproducts];
  }

  List<ProductModel> get favProducts {
    return [..._allproducts.where((element) => element.isFav)];
  }
}
