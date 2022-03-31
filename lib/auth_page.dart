import 'package:flutter/material.dart';
import "./auth_page_login.dart";
import "./auth_page_regsiter.dart";

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: Colors.black,
            ),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                width: double.infinity,
                height: double.infinity,
                color: const Color(0xffff8a00),
                child: Column(
                  children: const [
                    Image(
                      height: 130,
                      image: AssetImage("./assets/logo/logo_ayam.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Restoran Ayam Favorit Anda",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(190),
                child: TabBar(
                  labelColor: Colors.white,
                  indicatorColor: Color(0xff2f4858),
                  indicatorWeight: 4,
                  tabs: [
                    Tab(
                      text: "Masuk",
                    ),
                    Tab(
                      text: "Daftar",
                    ),
                  ],
                ),
              ),
            ),
            body: const TabBarView(
              children: [
                AuthPageLogin(),
                AuthPageRegister(),
                //
              ],
            )),
      ),
    );
  }
}
