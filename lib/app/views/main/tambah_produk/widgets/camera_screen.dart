import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool isCameraReady = false;

  CameraController? _camController;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  initCamera() async {
    var cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      CameraDescription camera = cameras.first;
      _camController = CameraController(
        camera,
        ResolutionPreset.medium,
      );

      _camController?.initialize().then((value) {
        setState(() {
          isCameraReady = true;
        });
      });
    }
  }

  @override
  void dispose() {
    _camController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        text:"Ambil Gambar",
        child: false,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.topCenter,
            child: _buildKamera(),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: const Color.fromARGB(255, 205, 201, 201),
              child: IconButton(
              iconSize: 50,
              onPressed: () async {
                await _camController?.initialize();
                XFile? image = await _camController?.takePicture();
                if (image != null) {
                  Navigator.of(context).pop(image);
                }
              },
              icon: const Icon(Icons.camera_alt_sharp),
            ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildKamera() {
    if (isCameraReady == false) {
      return const CircularProgressIndicator();
    }
    if (_camController != null) {
      return CameraPreview(_camController!);
    }
    return Container();
  }
}
