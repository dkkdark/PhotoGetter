import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_getter/domain/provider/photo_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class CameraScreen extends ConsumerStatefulWidget {
  const CameraScreen({
    super.key,
    required this.camera
  });

  final CameraDescription camera;

  @override
  CameraState createState() => CameraState();
}


class CameraState extends ConsumerState<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool isFirstContainerVisible = true;
  late bool _isButtonEnable;

  final valueController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
      enableAudio: false
    );
    _controller.setFlashMode(FlashMode.off);

    _initializeControllerFuture = _controller.initialize();

    _isButtonEnable = true;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void loadImage() async {
    XFile? image;

    String comment = valueController.text;
    valueController.text = "";

    if (kIsWeb) {
      // there is problem with uploading multipart in web
      var snackBar = const SnackBar(
        content: Text("Don't use web browser to upload image"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else if (Platform.isAndroid || Platform.isIOS) {
      PermissionStatus permissionMobile = await Permission.camera.status;
      if (permissionMobile.isGranted == true) {
        await _initializeControllerFuture;
        image = await _controller.takePicture();
      }
    }
    Position? position;
    var serviceEnabled = await Geolocator.isLocationServiceEnabled();
    var locationPermission = await Geolocator.checkPermission();
    if (serviceEnabled && (locationPermission == LocationPermission.always || locationPermission == LocationPermission.whileInUse)) {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }

    ref.read(photoDataProvider.notifier).sendPhoto(image, comment, position?.latitude, position?.longitude);
  }

  void onSendClicked() {
    setState(() {
      _isButtonEnable = false;
      loadImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(photoDataProvider, ((oldValue, newValue) {
      if (newValue.message != null && !newValue.isLoading) {
         var snackBar = SnackBar(
          content: Text(newValue.message!),
         );
         ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      if (!newValue.isLoading) {
        setState(() {
          _isButtonEnable = true;
        });
      }
    }),
    );

    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return SizedBox(
                            width:  MediaQuery.of(context).size.width,
                            height:  MediaQuery.of(context).size.height * 0.7,
                            child: CameraPreview(_controller)
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                    Column(
                      children: [
                        CameraTextField(valueController: valueController,),
                      const SizedBox(height: 20),
                      FilledButton(
                        onPressed: () {
                          _isButtonEnable ? onSendClicked() : null;
                        },
                        style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blueAccent)),
                        child: Text(_isButtonEnable ? "Send" : "Processing...",
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ]
                    ),
                ],
              )
          ),
        )
    );
  }
}


class CameraTextField extends StatefulWidget {
  const CameraTextField({
    super.key,
    required this.valueController
  });

  final TextEditingController valueController;

  @override
  State<CameraTextField> createState() => CameraTextFieldState();
}

class CameraTextFieldState extends State<CameraTextField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0),
      child: TextField(
        controller: widget.valueController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Comment',
        ),
      ),
    );
  }
}