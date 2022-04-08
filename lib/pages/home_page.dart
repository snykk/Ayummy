import 'package:flutter/material.dart';
import './detail_menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                                  text:( _currentIndex == 1 ? "Favoritmu,": "Selamat Datang,"),
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
                                )
                              ),
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
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(190),
          child: SizedBox(
          ),
        ),
        elevation: 0,
      ),
      body: GridView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 8/9,
        ),
        children: <GestureDetector>[
          customCard(),
          customCard(),
          customCard(),
          customCard(),
          customCard(),
          customCard(),
          customCard(),
          customCard(),
          customCard(),
          customCard(),
          customCard(),
          customCard(),
          customCard(),
          customCard(),
          customCard(),
          customCard(),
        ],
      ),
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

  GestureDetector customCard() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
          return const DetailMenuPage();
        }));
      },
      child: Card(
        child: Container(
          width: 130,
          height: 160,
          decoration: BoxDecoration(
            // border: Border.all(color: const Color.fromARGB(255, 248, 151, 24), width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: const [
              SizedBox(
                width: double.infinity,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/makanan/ayam_bakar_rica.jpg"),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Ayam bakar Rica-Rica",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                heightFactor: 2.5,
              ),
              Center(
                child: Text(
                  "Rp. 11,500",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        elevation: 8,
        shadowColor: Colors.black,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white, width: 1)),
      ),
    );
  }
}