import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
    final String id;
    final String roleId;
    final String name;
    final String email;
    final String phone;
    final String password;
    final String imageUrl;
    final String address;
    final double latitude;
    final double longitude;
    final List<dynamic> productUserFav;
    final List<dynamic> cart;
    final List<dynamic> order;
    final DateTime createAt;
    final DateTime updateAt;

    UserModel({
        required this.id,
        required this.roleId,
        required this.name,
        required this.email,
        required this.phone,
        required this.password,
        required this.imageUrl,
        required this.address,
        required this.latitude,
        required this.longitude,
        required this.productUserFav,
        required this.cart,
        required this.order,
        required this.createAt,
        required this.updateAt,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        roleId: json["role_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        imageUrl: json["image_url"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        productUserFav: json["productUserFav"],
        cart: json["cart"],
        order: json["order"],
        createAt: (json["create_at"] as Timestamp).toDate(),
        updateAt: (json["update_at"] as Timestamp).toDate(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "image_url": imageUrl,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "productUserFav": productUserFav,
        "cart": cart,
        "order":order,
        "create_at": createAt,
        "update_at": updateAt,
    };
}
