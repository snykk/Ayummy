import 'package:flutter/material.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Center(
          child: Row(
            children: [
              Container(
                width: 85,
                height: double.infinity,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Image(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/makanan/ayam_bakar_rica.jpg"),
                  ),
                ),
              ),
              const SizedBox(
                width: 120,
                height: double.infinity,
                child: Center(
                  child: Text(
                    "Ayam bakar madu",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: 90,
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color(0xff2f4858), width: 2.0)),
                      child: const Icon(
                        Icons.remove,
                        size: 20,
                        color: Color(0xff2f4858),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: Center(
                        child: Text(
                          2.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2f4858),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color(0xff2f4858), width: 2.0)),
                      child: const Icon(
                        Icons.add,
                        size: 20,
                        color: Color(0xff2f4858),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      elevation: 6,
      shadowColor: const Color.fromRGBO(255, 255, 255, 50),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 1)),
    );
  }
}
