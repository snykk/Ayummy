
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/user_provider.dart';
import '../services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  final String _defaultImage =
      "https://firebasestorage.googleapis.com/v0/b/a-yummy.appspot.com/o/default.jpg?alt=media&token=d54615fd-cdf1-4a14-b7f1-e38af1064531";

  void register(
      {BuildContext? context, String? name, String? email, String? phone, String? password}) async {
    final _user = Provider.of<UserProvider>(context!, listen: false);
    AuthService().signUp(context: context, email: email!,password: password!).then(
      (user) async {
          _user.addUser(
          name: name,
          email: email,
          phone: phone,
          password: password,
          img: _defaultImage,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Akun berhasil didaftarkan')));
        Navigator.pushReplacementNamed(context, '/auth').then(
          (_) => Navigator.pop(context),
        );
      },
    );
  }

  void login(
      {BuildContext? context,
      String? email,
      String? password}) {
    final _user = Provider.of<UserProvider>(context!, listen: false);
    log("pe");
    AuthService authService = AuthService();
    authService.signIn(context: context, email: email, password: password).then(
      (user) async {
        if (user.runtimeType == bool && user == false) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email belum diverifikasi')));
          return;
        }
        await _user.getUserByEmail(email: email);
        log("okee");
        final pref = await SharedPreferences.getInstance();
        if (pref.getBool("oldUser") == true) {
          Navigator.pushReplacementNamed(context, '/main').then(
            (_) => Navigator.pop(context),
          );
        } else {
          Navigator.pushReplacementNamed(context, '/onboarding').then(
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
          '/auth',
          (route) => false,
        ).then(
          (_) => Navigator.pop(context),
        );
      },
    );
  }
}
