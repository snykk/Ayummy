import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './onboarding.dart';


class AuthPageLogin extends StatelessWidget {
  const AuthPageLogin({
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
              TextInputType.number,
               "No Handphone",
                false,
                <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
            ),
            const SizedBox(
              height: 20,
            ),
            customInput(
              TextInputType.name,
              "Masukkan Password",
              true,
              null
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
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                  return const Onboarding();
                }));
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
              text: const TextSpan(
                text: "Belum punya akun? ",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                children: <TextSpan> [
                  TextSpan(
                    text: "Daftar",
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
        prefixIcon: const Icon(
          Icons.phone_outlined,
          color: Color(0xff626663),
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