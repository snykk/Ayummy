import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/user_provider.dart';

class StartUp extends StatefulWidget {
  const StartUp({Key? key}) : super(key: key);

  @override
  _StartUp createState() => _StartUp();
}

Future<String> initRoute() async {
  final pref = await SharedPreferences.getInstance();

  log(pref.getBool('oldUser').toString());
  log("ini string id user: ${pref.getString("id")}");
  if (pref.getString("id") != null && pref.getBool("oldUser") == true) {
    return "/main";
  } else if (pref.getString("id") != null && pref.getBool("oldUser") == null) {
    return "/onboarding";
  }
  return "";
}

class _StartUp extends State<StartUp> {
  String _initRoute = "";

  @override
  void initState() {
    super.initState();
    initRoute().then((value) => _initRoute = value);
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 1);

    return Timer(duration, () {
        // Navigator.pushReplacementNamed(context, "/auth");
      if (_initRoute != "") {
        Provider.of<UserProvider>(context, listen: false).getUserByDocId().then((_) => setState(() {}));
        Timer(const Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, _initRoute);
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, "/auth");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange,
      body: Container(
        child: Image.asset("assets/logo/logo_ayam.png"),
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFFF8A00),
      ),
    );
  }
}