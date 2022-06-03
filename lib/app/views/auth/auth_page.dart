import 'package:flutter/material.dart';
import 'widgets/login_section.dart';
import 'widgets/register_section.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = const <Tab>[
    Tab(text: 'Masuk'),
    Tab(text: 'Daftar'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(190),
            child: TabBar(
              labelColor: Colors.white,
              indicatorColor: const Color(0xff2f4858),
              indicatorWeight: 4,
              tabs: myTabs,
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            LoginSection(),
            RegisterSection(),
          ],
        ),
      ),
    );
  }
}
