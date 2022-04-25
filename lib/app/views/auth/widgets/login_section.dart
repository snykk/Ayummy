import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './custom_input.dart';


class LoginSection extends StatelessWidget {
  const LoginSection({
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
            CustomInput(
              keyboardType: TextInputType.number, 
              text: "No Handphone", 
              obscureText: false, 
              inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ], 
              customIconData: Icons.phone_outlined,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomInput(
              keyboardType: TextInputType.name, 
              text: "Masukkan Password", 
              obscureText: true, 
              customIconData: Icons.lock_outlined,
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
                Navigator.pushReplacementNamed(context, '/onboarding');
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
}

