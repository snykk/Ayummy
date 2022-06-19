import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/app/providers/user_provider.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';

enum SingingCharacter { langsung, gopay, dana }

class Pembayaran extends StatefulWidget {
  const Pembayaran({ Key? key }) : super(key: key);

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  SingingCharacter? _character = SingingCharacter.langsung;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false).getUser;
    // final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    Provider.of<CartProvider>(context, listen: false).setAllCart().then((_) => setState(() {}));
    final allCart = Provider.of<CartProvider>(context, listen: false).getAllCart;

    List<dynamic> payment = (_character.toString()).split('.');

    int sum = 0;

    for(var i =0; i < userProvider.cart.length; i ++){
      sum += allCart[i].productPrice! * allCart[i].qty;
    }

    List carts = [];

    for(var i =0; i < allCart.length; i ++){
      carts.add(
        {
          "id": allCart[i].id,
          "productName": allCart[i].productName,
          "qty": allCart[i].qty,
          "producPrice": allCart[i].productPrice,
        }
      );
    }

    List<dynamic> orders = [];
    // orders.add("abc");
    orders.add({
      "create_at": DateTime.now(),
      "isPayed": false,
      "paymentMethod": payment,
      "details": carts,
      "totalPrice": sum,
    });

    return Scaffold(
      appBar: const CustomAppbar(
        text:"Pembayaran",
        child: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              child: Text("Detail Pesanan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
            const SizedBox(
              height: 25,
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: allCart.length,
                itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                  value: allCart[i],
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text((i+1).toString() + '. ' + allCart[i].productName + ' x' + allCart[i].qty.toString(), style: const TextStyle(fontSize: 16)),
                          const Spacer(),
                          Text((allCart[i].productPrice! * allCart[i].qty).toString(), style: const TextStyle(fontSize: 16, color: Color(0xFFFF8A00)))
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text("Pembayaran", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Bayar Ditempat'),
                    leading: Radio<SingingCharacter>(
                      activeColor: const Color(0xFFFF8A00),
                      value: SingingCharacter.langsung,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Gopay'),
                    leading: Radio<SingingCharacter>(
                      activeColor: const Color(0xFFFF8A00),
                      value: SingingCharacter.gopay,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Dana'),
                    leading: Radio<SingingCharacter>(
                      activeColor: const Color(0xFFFF8A00),
                      value: SingingCharacter.dana,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                final docUser = FirebaseFirestore.instance.collection('user').doc(userProvider.id);
                docUser.update({
                  "order": orders
                });
                // orderProvider.addOrder(
                //   context: context,
                //   id: "123",
                //   paymentMethod: payment[1],
                //   details: carts,  
                //   totalPrice: sum, 
                // );
                
                Navigator.pushNamed(context, '/pembayaran_berhasil');
              },
              child: Ink(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 47, 109, 147),
                ),
                child: const Center(
                    child: Text(
                      "Bayar Sekarang",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


