import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/app/views/main/riwayat_pemesanan/detail_riwayat_pemesanan.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../../../providers/order_provider.dart';
import '../../../providers/user_provider.dart';

class RiwayatPemesanan extends StatelessWidget {
  const RiwayatPemesanan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final myCurr = NumberFormat("#,##0", "en_US");

    return Scaffold(
      appBar: const CustomAppbar(
        text: "Riwayat Pemesanan",
        child: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
            top: 30,
            right: MediaQuery.of(context).size.width * 0.1,
            left: MediaQuery.of(context).size.width * 0.1),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: orderProvider.setOrderData(userProvider.getUser.id),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              var item = orderProvider.getAllOrder;
              return ListView.builder(
                itemCount: orderProvider.getAllOrder.length,
                itemBuilder: (context, i) {
                  return Card(
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.05),
                    child: ListTile(
                      title: Text(DateFormat('dd MMM yyyy').format(item[i].createAt)),
                      subtitle: Text('Metode pembayaran menggunakan ${item[i].paymentMethod}'),
                      trailing: Text("Rp. ${myCurr.format(item[i].totalPrice)}"),
                      isThreeLine: true,
                      hoverColor: Colors.amber,
                      onTap: () {
                        Navigator.of(context).push(
                          // lempar value dari ProductModel ke detail menu page
                          MaterialPageRoute(builder: (context) {
                            return ChangeNotifierProvider.value(
                              value: item[i],
                              child: const DetailRiwayatPemesanan(),
                            );
                          }),
                        );
                      },
                    ),
                    elevation: 5,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
