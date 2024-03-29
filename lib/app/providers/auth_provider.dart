import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/user_provider.dart';
import '../routes/route.dart';
import '../services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  final String _defaultImage =
      "https://firebasestorage.googleapis.com/v0/b/a-yummy.appspot.com/o/profile%2Fdefault.jpg?alt=media&token=7c8afaab-36e5-43e4-935e-3973475d4c7c";

  void register(
      {BuildContext? context, String? name, String? email, String? phone, String? password}) async {
    final _user = Provider.of<UserProvider>(context!, listen: false);
    AuthService().signUp(context: context, email: email!, password: password!).then(
      (user) async {
        _user.addUser(
          name: name,
          email: email,
          phone: phone,
          password: password,
          img: _defaultImage,
        );
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Akun berhasil didaftarkan')));
        Navigator.pushReplacementNamed(context, Routes.auth).then(
          (_) => Navigator.pop(context),
        );
      },
    );
  }

  void login({BuildContext? context, String? email, String? password}) {
    final _user = Provider.of<UserProvider>(context!, listen: false);
    log("pe");
    AuthService authService = AuthService();
    authService.signIn(context: context, email: email, password: password).then(
      (user) async {
        if (user.runtimeType == bool && user == false) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Email belum diverifikasi')));
          return;
        }
        await _user.getUserByEmail(email: email);
        log("okee");
        final pref = await SharedPreferences.getInstance();
        if (pref.getBool("oldUser") == true) {
          Navigator.pushReplacementNamed(context, Routes.main).then(
            (_) => Navigator.pop(context),
          );
        } else {
          Navigator.pushReplacementNamed(context, Routes.onboarding).then(
            (_) => Navigator.pop(context),
          );
        }
      },
    );
  }

  void logout(BuildContext context, AuthService authService) {
    authService.signOut(context).then(
      (value) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.auth,
          (route) => false,
        ).then(
          (_) => Navigator.pop(context),
        );
      },
    );
  }
}
