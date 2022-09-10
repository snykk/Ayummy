import "package:flutter/material.dart";
import 'package:project/app/constants/palettes.dart';
import 'package:project/app/providers/auth_provider.dart';
import 'package:project/app/services/auth_services.dart';
import 'package:project/app/views/main/profile/widgets/option_card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/ratio.dart';
import '../../../providers/user_provider.dart';
import '../../../routes/route.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Future<void> _dialogConfirmation(context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Sistem'),
          content: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                Text('Apakah anda yakin ingin mengakhiri sesi?'),
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
              child: const Text('Akhiri'),
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                authProvider.logout(context, AuthService());
                pref.remove("id");
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context).getUser;

    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: Ratio(context).widthApp * 0.8,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Detail Personal",
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.ubah_profile);
                    },
                    child: const Text(
                      "ubah",
                      style: TextStyle(
                        fontSize: 16,
                        color: MyPalettes.appOrange,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 140,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyPalettes.appOrange,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                fit: BoxFit.fill,
                                image: NetworkImage(userProvider.imageUrl),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 160,
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userProvider.name,
                                  style: const TextStyle(fontSize: 20, color: Colors.white),
                                ),
                                Text(
                                  userProvider.email,
                                  style: const TextStyle(fontSize: 12, color: Colors.white),
                                ),
                                Text(
                                  userProvider.phone,
                                  style: const TextStyle(fontSize: 12, color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 285,
                      height: 1,
                      color: Colors.white,
                    ),
                    Text(
                      (userProvider.address == "") ? "Alamat belum diisi" : userProvider.address,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              (userProvider.roleId == '1')
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.riwayat_pemesanan);
                      },
                      child: const OptionCard(text: Text("Riwayat Pemesanan")),
                    ),
              const SizedBox(
                height: 10,
              ),
              (userProvider.roleId == '1')
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.belum_diulas);
                      },
                      child: const OptionCard(text: Text("Belum diulas")),
                    ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.telah_diulas);
                },
                child: const OptionCard(text: Text("Telah diulas")),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.promo);
                },
                child: const OptionCard(text: Text("Promo")),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.pengaturan);
                },
                child: const OptionCard(text: Text("Pengaturan")),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () async {
                    _dialogConfirmation(context);
                  },
                  mini: true,
                  child: const Icon(Icons.logout),
                  backgroundColor: MyPalettes.appOrange,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
