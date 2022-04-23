import "package:flutter/material.dart";
import 'package:project/app/views/main/checkout/widgets/checkout_card.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 40, left: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CheckoutCard(),
              const SizedBox(
                height: 5,
              ),
              const CheckoutCard(),
              const SizedBox(
                height: 5,
              ),
              const CheckoutCard(),
              const SizedBox(
                height: 5,
              ),
              const CheckoutCard(),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  print("punten");
                },
                child: Ink(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff2f4858),
                  ),
                  child: const Center(
                    child: Text(
                      "Checkout Sekarang",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
