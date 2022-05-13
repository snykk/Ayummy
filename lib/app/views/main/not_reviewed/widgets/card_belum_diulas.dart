import 'package:flutter/material.dart';

class CardBelumDiulas extends StatelessWidget {
  final String image;
  final String food;
  const CardBelumDiulas({
    Key? key,
    required this.image,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(47, 0, 47, 20),
      width: 320,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset.fromDirection(-15, -5),
            ),
          ]),
      child: Row(children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Text(
                food,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 50, 0),
              width: 87,
              height: 29,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 147, 18, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    )),
                onPressed: () {
                  Navigator.pushNamed(context, "/rating");
                },
                child: const Text(
                  "Beri Rating",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
