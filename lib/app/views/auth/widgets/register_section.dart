import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:project/app/constants/palettes.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';

class RegisterSection extends StatefulWidget {
  const RegisterSection({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterSection> createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<RegisterSection> {
  late TextEditingController _nameC;
  late TextEditingController _emailC;
  late TextEditingController _phoneC;
  late TextEditingController _passC;
  late TextEditingController _verifPassC;

  @override
  void initState() {
    _nameC = TextEditingController();
    _emailC = TextEditingController();
    _phoneC = TextEditingController();
    _passC = TextEditingController();
    _verifPassC = TextEditingController();
    super.initState();
  }

  bool _isShow = false;
  void _eyeToggle() {
    setState(() {
      _isShow = !_isShow;
    });
  }

  bool _isShowVerif = false;
  void _eyeToggleVerif() {
    setState(() {
      _isShowVerif = !_isShowVerif;
    });
  }

  @override
  void dispose() {
    _nameC.dispose();
    _emailC.dispose();
    _phoneC.dispose();
    _passC.dispose();
    _verifPassC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.only(
        top: 35,
        left: 50,
        right: 50,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _nameC,
              keyboardType: TextInputType.name,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                prefixIcon: const Icon(
                  Icons.person_outline_rounded,
                  color: MyPalettes.appGrey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: MyPalettes.appGrey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: MyPalettes.appGrey,
                  ),
                ),
                hintText: "Nama Lengkap",
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailC,
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: MyPalettes.appGrey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: MyPalettes.appGrey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: MyPalettes.appGrey,
                  ),
                ),
                hintText: "Masukkan Email",
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _phoneC,
              keyboardType: TextInputType.number,
              enableSuggestions: false,
              autocorrect: false,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                prefixIcon: const Icon(
                  Icons.phone_outlined,
                  color: MyPalettes.appGrey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: MyPalettes.appGrey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: MyPalettes.appGrey,
                  ),
                ),
                hintText: "No Handphone",
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passC,
              keyboardType: TextInputType.name,
              obscureText: !_isShow,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                prefixIcon: const Icon(
                  Icons.lock_outlined,
                  color: MyPalettes.appGrey,
                ),
                suffixIcon: InkWell(
                  onTap: _eyeToggle,
                  child: Icon(
                    (!_isShow) ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: MyPalettes.appGrey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: MyPalettes.appGrey,
                  ),
                ),
                hintText: "Masukkan Password",
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _verifPassC,
              keyboardType: TextInputType.name,
              obscureText: !_isShowVerif,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                prefixIcon: const Icon(
                  Icons.lock_outlined,
                  color: MyPalettes.appGrey,
                ),
                suffixIcon: InkWell(
                  onTap: _eyeToggleVerif,
                  child: Icon(
                    (!_isShowVerif) ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: MyPalettes.appGrey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: MyPalettes.appGrey,
                  ),
                ),
                hintText: "Masukkan Ulang Password",
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (_nameC.text == "" ||
                    _emailC.text == "" ||
                    _phoneC.text == "" ||
                    _passC.text == "" ||
                    _verifPassC.text == "") {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Inputan tidak boleh kosong')));
                } else if (_passC.text != _verifPassC.text) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Password tidak sama')));
                } else {
                  auth.register(
                    context: context,
                    name: _nameC.text,
                    email: _emailC.text,
                    phone: _phoneC.text,
                    password: _passC.text,
                  );
                }
              },
              child: Ink(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyPalettes.appDark,
                ),
                child: const Center(
                  child: Text(
                    "Daftar",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            RichText(
              text: TextSpan(
                text: "Sudah punya akun? ",
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Masuk",
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()..onTap = () => print("oke"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
