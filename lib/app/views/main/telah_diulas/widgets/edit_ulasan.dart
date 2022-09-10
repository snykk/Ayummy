// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project/app/constants/palettes.dart';
import 'package:project/app/providers/product_provider.dart';
import 'package:project/app/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../../providers/rating_provider.dart';

class EditRating extends StatefulWidget {
  const EditRating({Key? key}) : super(key: key);

  @override
  State<EditRating> createState() => _RatingState();
}

class _RatingState extends State<EditRating> {
  double _rating = 0;

  Future<void> _dialogConfirmation(context, productId, double rating, String ratingId) async {
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
                Text('Apakah anda yakin ingin mengubah ulasan?'),
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
                ratingProvider.updateRating(context, ratingId, rating);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    if (_rating == 0) {
      _rating = args["rating"];
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(67, 290, 67, 210),
            width: 280,
            height: 150,
            padding: const EdgeInsets.all(21.0),
            decoration: BoxDecoration(
              color: MyPalettes.appOrange,
              border: Border.all(color: MyPalettes.appOrange),
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
                  initialRating: args["rating"],
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
                        "rating $_rating",
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
                  backgroundColor: const Color.fromRGBO(47, 72, 88, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )),
              onPressed: () {
                _dialogConfirmation(
                  context,
                  args["id"],
                  _rating,
                  args["ratingId"],
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
