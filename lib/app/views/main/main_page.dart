import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/app/providers/user_provider.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';
import 'package:project/app/views/main/widgets/appbar_search.dart';
import 'package:provider/provider.dart';
import './home/home_page.dart';
import './favorite/favorit_page.dart';
import './chat/chat_page.dart';
import 'cart/cart_page.dart';
import './profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  static final List<Widget> _pageOptionsUser = <Widget>[
    const HomePage(),
    const FavoritePage(),
    const ChatPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  final List _appbarOptionsUser = [
    const AppBarSearch(
      currentIndex: 0,
    ),
    const AppBarSearch(
      currentIndex: 1,
    ),
    null,
    const CustomAppbar(
      text: "Menu dipesan",
      child: false,
    ),
    const CustomAppbar(
      text: "Profilku",
      child: false,
    ),
  ];

  static final List<Widget> _pageOptionsAdmin = <Widget>[
    const HomePage(),
    Container(),
    const ProfilePage(),
  ];

  final List _appbarOptionsAdmin = [
    const AppBarSearch(
      currentIndex: 0,
    ),
    null,
    const CustomAppbar(
      text: "Profilku",
      child: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final userProvider =
        Provider.of<UserProvider>(context, listen: false).getUser;
    return Scaffold(
      appBar: (userProvider.roleId == '1')
          ? _appbarOptionsAdmin[_currentIndex]
          : _appbarOptionsUser[_currentIndex],
      body: (userProvider.roleId == '1')
          ? _pageOptionsAdmin[_currentIndex]
          : _pageOptionsUser[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: (userProvider.roleId == '1')
            ? [
                customBottomNavBar(Icons.home_outlined),
                customBottomNavBar(Icons.badge),
                customBottomNavBar(Icons.person_outline_rounded),
              ]
            : [
                customBottomNavBar(Icons.home_outlined),
                customBottomNavBar(Icons.favorite_outline),
                customBottomNavBar(Icons.chat_bubble_outline_rounded),
                customBottomNavBar(Icons.shopping_cart_outlined),
                customBottomNavBar(Icons.person_outline_rounded),
              ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem customBottomNavBar(IconData custom) {
    return BottomNavigationBarItem(
      icon: Icon(
        custom,
        color: Colors.grey,
      ),
      label: "",
      activeIcon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Icon(
                custom,
                color: const Color(0xffff8a00),
              ),
            ),
            Container(
              width: 25,
              height: 3,
              decoration: BoxDecoration(
                  color: const Color(0xffff8a00),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ],
        ),
      ),
    );
  }
}
