import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:project/app/views/auth/widgets/custom_input.dart';
import '../../onboarding/onboarding.dart';


class RegisterSection extends StatelessWidget {
  const RegisterSection({
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
            const CustomInput(
              keyboardType: TextInputType.name,
              text: "Nama Lengkap",
              obscureText: false,
              inputFormatters: null,
              customIconData: Icons.person_outline_rounded
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomInput(
              keyboardType: TextInputType.emailAddress,
              text: "Masukkan Email",
              obscureText: false,
              inputFormatters: null,
              customIconData: Icons.email_outlined
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInput(
              keyboardType: TextInputType.number,
              text: "No Handphone",
              obscureText: false,
              inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              customIconData: Icons.phone_outlined
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomInput(
              keyboardType: TextInputType.name,
              text: "Masukkan Password",
              obscureText: true,
              inputFormatters: null,
              customIconData: Icons.lock_outlined
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomInput(
              keyboardType: TextInputType.name,
              text: "Masukkan Ulang Password",
              obscureText: true,
              inputFormatters: null,
              customIconData: Icons.lock_outlined
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
}
