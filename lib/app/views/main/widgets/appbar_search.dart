import 'package:flutter/material.dart';
import 'package:project/app/constants/palettes.dart';
import 'package:provider/provider.dart';
import '../../../providers/user_provider.dart';

class AppBarSearch extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSearch({Key? key, this.currentIndex})
      : preferredSize = const Size.fromHeight(240),
        super(key: key);

  final int? currentIndex;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final userData = user.getUser;

    return AppBar(
      flexibleSpace: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: 190,
                color: MyPalettes.appOrange,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text((currentIndex == 1 ? "Favoritmu," : "Selamat Datang, "),
                                  style: const TextStyle(fontSize: 20, color: Colors.white)),
                              Text(userData.name,
                                  style: const TextStyle(fontSize: 20, color: Colors.white)),
                            ],
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
                          contentPadding: const EdgeInsets.symmetric(vertical: 0),
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
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  Container(
                    height: 30,
                    width: 110,
                    decoration: BoxDecoration(
                      color: MyPalettes.appOrange2,
                      border: Border.all(color: MyPalettes.appOrange2, width: 2),
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
                      border: Border.all(color: MyPalettes.appOrange2, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "Makanan",
                        style: TextStyle(color: MyPalettes.appOrange2),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 110,
                    decoration: BoxDecoration(
                      border: Border.all(color: MyPalettes.appOrange2, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "Minuman",
                        style: TextStyle(color: MyPalettes.appOrange2),
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
          height: 100,
          width: double.infinity,
        ),
      ),
      elevation: 0,
    );
  }
}
