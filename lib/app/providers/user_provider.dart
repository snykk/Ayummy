import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/collection.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  bool isVerified = false;

  UserModel get getUser => _user!;

  set setUser(UserModel userModel) => _user = userModel;

  Future<void> getUserByEmail({String? email}) async {
    final user = await MyCollection.user.where("email", isEqualTo: email).get();
    final pref = await SharedPreferences.getInstance();
    await pref.setString("id", user.docs.first["id"]);
    setUser = UserModel.fromJson(user.docs.first.data());
  }

  Future<void> getUserByDocId() async {
    final pref = await SharedPreferences.getInstance();
    final data = await MyCollection.user.doc(pref.getString("id")).get();
    setUser = UserModel.fromJson(data.data() as Map<String, dynamic>);
  }

  void init(String uid) async {
    MyCollection.user.doc(uid).snapshots().listen((event) {
      _user = UserModel.fromJson(event.data()!);
      notifyListeners();
    });
  }

  Future<void> addUser({
    String? email,
    String? phone,
    String? password,
    String? img,
    String? name,
  }) async {
    QuerySnapshot<Object?> account = await MyCollection.user.where("email", isEqualTo: email).get();
    final user = MyCollection.user.doc();
    if (account.docs.isEmpty) {
      await user.set(
        UserModel(
          id: user.id,
          roleId: "2",
          name: name!,
          email: email!,
          phone: phone!,
          password: password!,
          imageUrl: img!,
          address: "",
          latitude: -8.165142,
          longitude: 113.716386,
          productUserFav: [],
          cart: [],
          order: [],
          promoTaken: [],
          createAt: DateTime.now(),
          updateAt: DateTime.now(),
        ).toJson(),
      );
    }
  }

  Future<void> updateUser({BuildContext? context, String? uid, Map<String, dynamic>? data}) async {
    await MyCollection.user.doc(uid!).update(data!).then((_) {
      init(uid);

      ScaffoldMessenger.of(context!)
          .showSnackBar(const SnackBar(content: Text('Berhasil diupdate')));
    }).catchError((error) {
      ScaffoldMessenger.of(context!)
          .showSnackBar(const SnackBar(content: Text('Terjadi kesalahan sistem!!!')));
      log("Error: $error");
    });
  }
}
