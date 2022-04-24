import 'package:flutter/material.dart';
import 'package:project/app/views/auth/auth_page.dart';
import 'package:project/app/views/main/main_page.dart';
import 'package:project/app/views/main/profile/bantuan.dart';
import 'package:project/app/views/main/profile/pengaturan.dart';
import 'package:project/app/views/main/widgets/detail_menu_page.dart';
import 'package:project/app/views/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
          secondary: Colors.black,
        ),
      ),
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const AuthPage(),
        '/onboarding': (context) => const Onboarding(),
        '/main': (context) => const MainPage(),
        '/detail': (context) => const DetailMenuPage(),
        '/pengaturan': (context) => const Pengaturan(),
        '/bantuan': (context) => const Bantuan(),
      }
    );
  }
}
