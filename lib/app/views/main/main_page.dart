import 'package:flutter/material.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';
import 'package:project/app/views/main/widgets/appbar_search.dart';
import './home/home_page.dart';
import './favorite/favorit_page.dart';
import './chat/chat_page.dart';
import 'checkout/checkout_page.dart';
import './profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  static  List<Widget> _pageOptions = <Widget>[
    HomePage(),
    FavoritePage(),
    ChatPage(),
    CheckoutPage(),
    ProfilePage(),
  ];

  final List _appbarOptions = [
       const AppBarSearch(currentIndex: 0,),
       const AppBarSearch(currentIndex: 1,),
       null,
       const CustomAppbar(text: "Menu dipesan", child: false,),
       const CustomAppbar(text: "Profilku", child: false,),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarOptions[_currentIndex],
      body: _pageOptions[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
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
