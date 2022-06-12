import 'package:flutter/material.dart';
import 'package:project/app/providers/promo_provider.dart';
import 'package:provider/provider.dart';

import '../../../providers/promo_provider.dart';
import '../widgets/custom_appbar.dart';

class Promo extends StatefulWidget {
  const Promo({Key? key}) : super(key: key);

  @override
  State<Promo> createState() => _PromoState();
}

class _PromoState extends State<Promo> {

  @override
  Widget build(BuildContext context) {
    final promoProvider = Provider.of<PromoProvider>(context, listen: false);

    return Scaffold(
        appBar: const CustomAppbar(
          text: "Promo",
          child: true,
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(
                top: 40,
                left: MediaQuery.of(context).size.width * 0.110,
                right: MediaQuery.of(context).size.width * 0.110),
            child: FutureBuilder(
              future: promoProvider.setAllPromo(),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(),);
                }
                return GridView.builder(
                  itemCount: promoProvider.getAllPromo.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 25,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 6.0),
                  ),
                  itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                      value: promoProvider.getAllPromo[i],
                      child: Container(
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
                                      promoProvider.getAllPromo[i].name,
                                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 25,
                                    child: Text(
                                      promoProvider.getAllPromo[i].detail,
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
                      )
                  ),
                );
              }
            )
        )
    );
  }
}

