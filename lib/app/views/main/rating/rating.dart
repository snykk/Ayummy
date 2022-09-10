// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project/app/constants/palettes.dart';
import 'package:project/app/providers/product_provider.dart';
import 'package:project/app/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../providers/rating_provider.dart';

class Rating extends StatefulWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double _rating = 0;

  Future<void> _dialogConfirmation(context, productId, double rating) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    final ratingProvider = Provider.of<RatingProvider>(context, listen: false);

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Sistem'),
          content: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                Text('Apakah anda yakin ingin mengulas produk?'),
              ],
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  const Color(0x15ff8a00),
                ),
                foregroundColor: MaterialStateProperty.all(
                  MyPalettes.appOrange,
                ),
              ),
              child: const Text('Batalkan'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  const Color(0x15ff8a00),
                ),
                backgroundColor: MaterialStateProperty.all(
                  MyPalettes.appOrange,
                ),
              ),
              child: const Text('Ulas'),
              onPressed: () async {
                productProvider.productReviewed(productId, userProvider.getUser.id);
                ratingProvider.addRating(
                  context: context,
                  productId: productId,
                  userId: userProvider.getUser.id,
                  rating: rating,
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(67, 290, 67, 210),
            width: 280,
            height: 150,
            padding: const EdgeInsets.all(21.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 147, 18, 1),
              border: Border.all(color: const Color.fromRGBO(255, 147, 18, 1)),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Berikan Nilai Anda",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RatingBar.builder(
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                (_rating != 0)
                    ? Text(
                        "Rating $_rating",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 42),
            width: 300,
            height: 64,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: MyPalettes.appDark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )),
              onPressed: () {
                _dialogConfirmation(
                  context,
                  productId,
                  _rating,
                );
              },
              child: const Text(
                "Selesai",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
