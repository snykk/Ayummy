import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import './onboarding.dart';


class AuthPageRegister extends StatelessWidget {
  const AuthPageRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            customInput(
              TextInputType.name,
              "Nama Lengkap",
              false,
              null,
              Icons.person_outline_rounded
            ),
            const SizedBox(
              height: 20,
            ),
            customInput(
              TextInputType.emailAddress,
              "Masukkan Email",
              false,
              null,
              Icons.email_outlined,
            ),
            const SizedBox(
              height: 20,
            ),
            customInput(
              TextInputType.number,
              "No Handphone",
              false,
              <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              Icons.phone_outlined,
            ),
            const SizedBox(
              height: 20,
            ),
            customInput(
              TextInputType.name,
              "Masukkan Password",
              true,
              null,
              Icons.lock_outlined,
            ),
            const SizedBox(
              height: 20,
            ),
            customInput(
              TextInputType.name,
              "Masukkan Ulang Password",
              true,
              null,
              Icons.lock_outlined,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                print("yuhu 'masuk' diclick");
              },
              child: Ink(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff2f4858),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return const Onboarding();
                      }));
                    },
                    child: const Text(
                      "Daftar",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            RichText(
              text: const TextSpan(
                text: "Sudah punya akun? ",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                children: <TextSpan> [
                  TextSpan(
                    text: "Masuk",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    )
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
  
  TextField customInput
  (
    TextInputType _keyboardType,
    String _text, 
    bool _obscureText,
    List<TextInputFormatter>? _inputFormatters,
    IconData _customIconData
  ) 
  {
    return TextField(
      keyboardType: _keyboardType,
      obscureText: _obscureText,
      enableSuggestions: false,
      autocorrect: false,
      inputFormatters: _inputFormatters,
      
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        prefixIcon: Icon(
          _customIconData,
          color: const Color(0xff626663),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff626663),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff626663),
          ),
        ),
        hintText: _text,
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
