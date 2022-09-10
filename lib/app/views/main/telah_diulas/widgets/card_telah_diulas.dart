import 'package:flutter/material.dart';
import 'package:project/app/constants/palettes.dart';
import 'package:project/app/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../../routes/route.dart';

class CardTelahDiulas extends StatelessWidget {
  final String id;
  final String ratingId;
  final String image;
  final String food;
  final double rating;
  const CardTelahDiulas({
    Key? key,
    required this.id,
    required this.ratingId,
    required this.image,
    required this.food,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
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
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(image),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (userProvider.getUser.roleId == "2")
                      ? Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 50, 0),
                          width: 87,
                          height: 29,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: MyPalettes.appOrange2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                )),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                Routes.edit_rating,
                                arguments: {
                                  'id': id,
                                  'rating': rating,
                                  'ratingId': ratingId,
                                },
                              );
                            },
                            child: const Text(
                              "Edit Ulasan",
                              style: TextStyle(fontSize: 11, color: Colors.white),
                            ),
                          ),
                        )
                      : Container(),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text(
                          "rating $rating",
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
