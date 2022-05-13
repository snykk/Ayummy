import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String food;
  final String price;
  const ProductCard({
    Key? key, required this.image, required this.food, required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
      child: Card(
        child: Container(
          width: 130,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(image),
                  ),
                ),
              ),
              Center(
                child: Text(
                  food,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                heightFactor: 2.5,
              ),
              Center(
                child: Text(
                  "Rp. $price",
                  style: const TextStyle(
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
