// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../views/auth/auth_page.dart';
import '../views/main/bantuan/bantuan.dart';
import '../views/main/edit/edit_profile.dart';
import '../views/main/location/get_location.dart';
import '../views/main/main_page.dart';
import '../views/main/not_reviewed/not_reviewed_page.dart';
import '../views/main/pembayaran/bukti_pembayaran.dart';
import '../views/main/pembayaran/pembayaran.dart';
import '../views/main/pembayaran/pembayaran_berhasil.dart';
import '../views/main/pengaturan/pengaturan.dart';
import '../views/main/promo/promo.dart';
import '../views/main/rating/rating.dart';
import '../views/main/riwayat_pemesanan/detail_riwayat_pemesanan.dart';
import '../views/main/riwayat_pemesanan/riwayat_pemesanan.dart';
import '../views/main/tambah_produk/tambah_produk.dart';
import '../views/main/telah_diulas/telah_diulas.dart';
import '../views/main/telah_diulas/widgets/edit_ulasan.dart';
import '../views/onboarding/onboarding.dart';
import '../views/startup/startuppage.dart';

class Routes {
  static const String startup = "/startup";
  static const String auth = "/auth";
  static const String onboarding = "/onboarding";
  static const String main = "/main";
  static const String pengaturan = "/pengaturan";
  static const String bantuan = "/bantuan";
  static const String detail_riwayat_pemesanan = "/detail_riwayat_pemesanan";
  static const String riwayat_pemesanan = "/riwayat_pemesanan";
  static const String belum_diulas = "/belum_diulas";
  static const String telah_diulas = "/telah_diulas";
  static const String ubah_profile = "/ubah_profile";
  static const String get_location = "/get_location";
  static const String rating = "/rating";
  static const String promo = "/promo";
  static const String pembayaran = "/pembayaran";
  static const String pembayaran_berhasil = "/pembayaran_berhasil";
  static const String bukti_pembayaran = "/bukti_pembayaran";
  static const String tambah_produk = "/tambah_produk";
  static const String edit_rating = "/edit_rating";

  static final mapping = <String, WidgetBuilder>{
    startup: (context) => const StartUp(),
    auth: (context) => const AuthPage(),
    onboarding: (context) => const Onboarding(),
    main: (context) => const MainPage(),
    pengaturan: (context) => const Pengaturan(),
    bantuan: (context) => const Bantuan(),
    detail_riwayat_pemesanan: (context) => const DetailRiwayatPemesanan(),
    riwayat_pemesanan: (context) => const RiwayatPemesanan(),
    belum_diulas: (context) => const BelumDiulas(),
    telah_diulas: (context) => const TelahDiulas(),
    ubah_profile: (context) => const UbahProfile(),
    get_location: (context) => const GetLocation(),
    rating: (context) => const Rating(),
    promo: (context) => const Promo(),
    pembayaran: (context) => const Pembayaran(),
    pembayaran_berhasil: (context) => const PembayaranBerhasil(),
    bukti_pembayaran: (context) => const BuktiPembayaran(),
    tambah_produk: (context) => const TambahProduk(),
    edit_rating: (context) => const EditRating(),
  };
}
