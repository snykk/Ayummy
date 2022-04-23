import 'package:flutter/material.dart';
import 'package:project/app/views/main/widgets/appbar_search.dart';
import './home/home_page.dart';
import './favorite/favorit_page.dart';
import './chat/chat_page.dart';
import 'checkout/checkout_page.dart';
import './profile/profile_page.dart';
import 'checkout/widgets/appbar_checkout.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  static const List<Widget> _pageOptions = <Widget>[
    HomePage(),
    FavoritePage(),
    ChatPage(),
    CheckoutPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_final_fields
    List _appbarOptions = [
       const AppBarSearch(currentIndex: 0,),
       const AppBarSearch(currentIndex: 1,),
       null,
       const AppBarCheckout(),
       null,
    ];
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

class AppBarSearchd extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSearchd({
    Key? key,
    required int currentIndex,
  }) : _currentIndex = currentIndex, super(key: key);

  final int _currentIndex;

  

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Stack(
        fit: StackFit.loose,
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: 190,
                color: const Color(0xffff8a00),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    right: 43,
                    bottom: 20,
                    left: 43,
                  ),
                  child: Column(
                    children: [
                      Row(
                        // selamat datang dan lonceng notif
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 150,
                            child: RichText(
                                text: TextSpan(
                              text: (_currentIndex == 1
                                  ? "Favoritmu,"
                                  : "Selamat Datang,"),
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: " Patrick Star",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                )
                              ],
                            )),
                          ),
                          const Icon(
                            Icons.notifications_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        keyboardType: TextInputType.name,
                        enableSuggestions: false,
                        autocorrect: false,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 0),
                          prefixIcon: const Icon(
                            Icons.search_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: "Cari Menu",
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 221, 221, 221),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 85,
                color: Colors.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 30,
                        width: 110,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 248, 151, 24),
                          border: Border.all(
                              color: const Color.fromARGB(255, 248, 151, 24),
                              width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Semua Menu",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 110,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 248, 151, 24),
                              width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Makanan",
                            style: TextStyle(
                                color: Color.fromARGB(255, 248, 151, 24)),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 110,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 248, 151, 24),
                              width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Minuman",
                            style: TextStyle(
                                color: Color.fromARGB(255, 248, 151, 24)),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(240);
}
