import 'package:flutter/material.dart';

class CardPromo extends StatelessWidget {
  final String promo;
  final String detail;
  const CardPromo({
    Key? key, required this.promo, required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            width: 45,
            height: 45,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage("assets/promo/ticket.png"),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 210,
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: 35,
                  child: Text(
                    promo,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 25,
                  child: Text(
                    detail,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
        ],
      ),
    );
  }
}
