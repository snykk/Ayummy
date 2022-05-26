import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:project/app/views/auth/auth_page.dart';
import 'package:project/app/views/main/edit/edit_profile.dart';
import 'package:project/app/views/main/main_page.dart';
import 'package:project/app/views/main/not_reviewed/not_reviewed_page.dart';
import 'package:project/app/views/main/bantuan/bantuan.dart';
import 'package:project/app/views/main/pembayaran/pembayaran.dart';
import 'package:project/app/views/main/pembayaran/pembayaran_berhasil.dart';
import 'package:project/app/views/main/pengaturan/pengaturan.dart';
import 'package:project/app/views/main/promo/promo.dart';
import 'package:project/app/views/onboarding/onboarding.dart';
import 'app/views/main/location/choose_location.dart';
import 'app/views/main/riwayat_pemesanan/riwayat_pemesanan.dart';
import 'app/views/main/rating/rating.dart';
import 'app/views/startup/startuppage.dart';

import 'app/providers/product_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
            secondary: Colors.black,
          ),
        ),
        initialRoute: '/startup',
        routes: {
          '/startup': (context) => const StartUp(),
          '/auth': (context) => const AuthPage(),
          '/onboarding': (context) => const Onboarding(),
          '/main': (context) => const MainPage(),
          '/pengaturan': (context) => const Pengaturan(),
          '/bantuan': (context) => const Bantuan(),
          '/riwayat_pemesanan': (context) => const RiwayatPemesanan(),
          '/belum_diulas': (context) => const BelumDiulas(),
          '/ubah_profile': (context) => const UbahProfile(),
          '/pilih_lokasi': (context) => const ChooseLocation(),
          '/rating': (context) => const Rating(),
          '/promo': (context) => const Promo(),
          '/pembayaran': (context) => const Pembayaran(),
          '/pembayaran_berhasil': (context) => const PembayaranBerhasil(),
        },
      ),
    );
  }
}
