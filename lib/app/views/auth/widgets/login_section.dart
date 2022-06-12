import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';


// ignore: must_be_immutable
class LoginSection extends StatefulWidget {
  const LoginSection({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  late TextEditingController _emailC;
  late TextEditingController _passC;

  @override
  void initState() {
    _emailC = TextEditingController();
    _passC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailC.dispose();
    _passC.dispose();
    super.dispose();
  }

  bool _isShow = false;
  void _eyeToggle() {
    setState(() {
      _isShow = !_isShow;
    });
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
              controller: _emailC,
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Color(0xff626663),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Color(0xff626663),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Color(0xff626663),
                  ),
                ),
                hintText: "Email Address",
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
                  color: Color(0xff626663),
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
                    color: Color(0xff626663),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Color(0xff626663),
                  ),
                ),
                hintText: "Masukkan Password",
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Lupa Password?",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (_emailC.text != "" && _passC.text != "") {
                  auth.login(
                    context: context,
                    email: _emailC.text,
                    password: _passC.text,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Inputan tidak boleh kosong')));
                } 
              },
              child: Ink(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff2f4858),
                ),
                child: const Center(
                  child: Text(
                    "Masuk",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Or",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                print("yuhu 'login with facebook' diclick");
              },
              child: Ink(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff1877f2),
                ),
                child: const Center(
                  child: Text(
                    "Login with Facebook",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              child: InkWell(
                onTap: () {
                  print("yuhu 'log in with google diclick");
                },
                child: Ink(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Text(
                      "Log in with Google",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              elevation: 6,
              shadowColor: Colors.black,
              shape:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:const BorderSide(color: Colors.white,width: 1)
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            RichText(
              text:  TextSpan(
                text: "Belum punya akun? ",
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                children: <TextSpan> [
                  TextSpan(
                    text: "Daftar",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),
                    recognizer: TapGestureRecognizer()..onTap = ()=> print("oke")
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

