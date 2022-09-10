import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/app/constants/palettes.dart';

import '../widgets/custom_appbar.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({Key? key}) : super(key: key);

  @override
  State<GetLocation> createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newGoogleMapController;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Position? currentPosition;
  var geoLocator = Geolocator();

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    debugPrint("ini posisi user ${currentPosition?.latitude} ${currentPosition?.longitude}");

    LatLng latLangPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition = CameraPosition(target: latLangPosition, zoom: 16);
    newGoogleMapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static const CameraPosition initLocation =
      CameraPosition(target: LatLng(-8.165073, 113.716418), zoom: 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(text: "Get Location", child: true),
      body: Stack(
        children: [
          GoogleMap(
            padding: const EdgeInsets.only(bottom: 0),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: initLocation,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;

              locatePosition();
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, currentPosition);
                },
                child: const Text(
                  "Pilih Lokasi",
                  style: TextStyle(fontSize: 18),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyPalettes.appDark),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
