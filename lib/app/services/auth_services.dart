import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AuthService {
  Future<void> signUp(
      {BuildContext? context, String? email, String? password,}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      if (FirebaseAuth.instance.currentUser != null &&
          !FirebaseAuth.instance.currentUser!.emailVerified) {
        log("Send email verification");
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      }

      log("Registration ended successfuly");

      return;
    } on FirebaseAuthException catch (e) {
      log(e.code);
      if (e.code == "weak-password") {
        ScaffoldMessenger.of(context!).showSnackBar(
          const SnackBar(content: Text('Weak password')));
      } else if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context!).showSnackBar(
          const SnackBar(content: Text('Email already in use')));
      }
      // assert(
      //     e.code != "weak-password", "Password yang anda masukkan tidak aman");
      // assert(e.code != "email-already-in-use", "Email sudah terdaftar");
      rethrow;
    }
  }

  Future<dynamic> signIn(
      {BuildContext? context, String? email, String? password}) async {
    final userProvider = Provider.of<UserProvider>(context!, listen: false);
    try {
      final UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      log("Login ended successfully");

      if (FirebaseAuth.instance.currentUser != null &&
          FirebaseAuth.instance.currentUser!.emailVerified) {
          userProvider.isVerified = true;
          return user;
      }
      
      return false;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email belum terdaftar')));
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password yang dimasukkan salah')));
      }

      rethrow;
    }
  }

  Future<void> signOut(BuildContext? context) async {
    await FirebaseAuth.instance.signOut();
    ScaffoldMessenger.of(context!).showSnackBar(
      const SnackBar(content: Text('Berhasil logout')));
    log("Success log out from email account");
  }
}
