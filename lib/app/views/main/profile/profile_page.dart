import 'dart:developer';

import "package:flutter/material.dart";
import 'package:project/app/providers/auth_provider.dart';
import 'package:project/app/services/auth_services.dart';
import 'package:project/app/views/main/profile/widgets/option_card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Future<void> _dialogConfirmation(context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
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
              child: const Text('Batalkan'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Akhiri'),
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                log(pref.getString("id")!);
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
    final user = Provider.of<UserProvider>(context);
    final userData = user.getUser;
    
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Detail Personal",
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/ubah_profile");
                    },
                    child: const Text(
                      "ubah",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffff8a00),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffff8a00),
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
                                image: NetworkImage(
                                    userData.imageUrl),
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
                                  userData.name,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Text(
                                 userData.email,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                Text(
                                  userData.phone,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
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
                      (userData.address == "") ? "Alamat belum diisi" : userData.address,
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
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/riwayat_pemesanan");
                },
                child: const OptionCard(text: Text("Riwayat Pemesanan")),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/belum_diulas");
                },
                child: const OptionCard(text: Text("Belum diulas")),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/promo");
                },
                child: const OptionCard(text: Text("Promo")),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/bantuan");
                },
                child: const OptionCard(text: Text("Bantuan")),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/pengaturan");
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
                  backgroundColor: const Color(0xffff8a00),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



      