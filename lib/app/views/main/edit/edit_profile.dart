
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project/app/views/main/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';

class UbahProfile extends StatefulWidget {
  const UbahProfile({Key? key}) : super(key: key);

  @override
  State<UbahProfile> createState() => _UbahProfileState();
}

class _UbahProfileState extends State<UbahProfile> {
  late TextEditingController _nameC;
  late TextEditingController _emailC;
  late TextEditingController _phoneC;
  late TextEditingController _addressC;

  late double userLatitude = -8.165142;
  late double userLongitude = 113.716386;
  bool isGetUserLoc = false;

  @override
  void initState() {
    _nameC = TextEditingController();
    _emailC = TextEditingController();
    _phoneC = TextEditingController();
    _addressC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameC.dispose();
    _emailC.dispose();
    _phoneC.dispose();
    _addressC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false);
    final userData = user.getUser;
    
    if (_nameC.text.isEmpty) {
    _nameC.text = userData.name;
    }
    if (_addressC.text.isEmpty) {
    _addressC.text = userData.address;
    }
    if (_phoneC.text.isEmpty) {
    _phoneC.text = userData.address;
    }

    _emailC.text = userData.email;
    
    return Scaffold(
      appBar: const CustomAppbar(text: "Ubah Data", child: true),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width *0.075,
            MediaQuery.of(context).size.width *0.08,
            MediaQuery.of(context).size.width *0.075,
            MediaQuery.of(context).size.width *0.075,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            const Text(
              "Nama",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: _nameC,
              keyboardType: TextInputType.name,
              obscureText: false,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 15),
                suffixIcon: const Icon(
                  Icons.edit,
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
                hintText: "Nama Lengkap",
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Email",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: _emailC,
              readOnly: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 15),
                suffixIcon: const Icon(
                  Icons.edit,
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
                hintText: "Email",
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "No. HP",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: _phoneC,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 15),
                suffixIcon: const Icon(
                  Icons.edit,
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
                hintText: "Email",
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Alamat",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: _addressC,
              keyboardType: TextInputType.multiline,
              enableSuggestions: false,
              autocorrect: false,
              maxLines: 4,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 15),
                suffixIcon: const Icon(
                  Icons.edit,
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
                hintText: "Masukkan alamat anda",
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              width: 350,
              height: 150,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )),
                onPressed: () {
                  // Navigator.pushNamed(context, "/pilih_lokasi");
                  Navigator.pushNamed(context, "/get_location").then((value) {
                    Position userPosition = value as Position;
                    if (userPosition.latitude != 0.0 && userPosition.longitude != 0.0) {
                      setState(() {
                        isGetUserLoc = true;
                        userLatitude = userPosition.latitude;
                        userLongitude = userPosition.longitude;
                      });
                    }
                  });
                },
                child: Container(),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                    image: AssetImage('assets/map/Peta_2.png'),
                    fit: BoxFit.fill),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black87,
                    spreadRadius: 0.5,
                  ),
                ]),
            ),
            (isGetUserLoc) ?
            const Center(
              child: Text(
                "lokasi user berhasil didapat",
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            )
            : Container(),
            const SizedBox(height: 15,),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  if (_nameC.text == userData.name && _addressC.text == userData.address && !isGetUserLoc) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Aksi dibatalkan, tidak ada perubahan')));
                  } else {
                    Map<String, dynamic> data = {
                      "name":_nameC.text,
                      "phone":_phoneC.text,
                      "address":_addressC.text,
                      "latitude":userLatitude,
                      "longitude":userLongitude,
                      "update_at":DateTime.now()
                    };
                    // ubahProfile(userData.id, data);
                    user.updateUser(context: context, uid: userData.id, data: data)
                    .then((_) => Navigator.of(context).pop());
                  }
                },
                child: const Text(
                  "Simpan"
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(47, 72, 88, 1),
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.275,
                    vertical: MediaQuery.of(context).size.height * 0.02,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
