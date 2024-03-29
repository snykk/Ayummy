import 'package:flutter/material.dart';
import 'package:project/app/constants/palettes.dart';

enum SingingCharacter { langsung, gopay, dana }

class MetodePembayaran extends StatefulWidget {
  const MetodePembayaran({Key? key}) : super(key: key);

  @override
  State<MetodePembayaran> createState() => _MetodePembayaranState();
}

class _MetodePembayaranState extends State<MetodePembayaran> {
  SingingCharacter? _character = SingingCharacter.langsung;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Bayar Ditempat'),
          leading: Radio<SingingCharacter>(
            activeColor: MyPalettes.appOrange,
            value: SingingCharacter.langsung,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Gopay'),
          leading: Radio<SingingCharacter>(
            activeColor: MyPalettes.appOrange,
            value: SingingCharacter.gopay,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Dana'),
          leading: Radio<SingingCharacter>(
            activeColor: MyPalettes.appOrange,
            value: SingingCharacter.dana,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
