import 'package:flutter/material.dart';

import '../detail_menu_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 8 / 9,
      ),
      children: <GestureDetector>[
        customCard(),
        customCard(),
        customCard(),
      ],
    );
  }

  GestureDetector customCard() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
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
