import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PreviewController extends GetxController {
  //TODO: Implement PreviewController
  dynamic argument = Get.arguments;
  late CameraController camera;
  late XFile picture;

  @override
  void onInit() {
    super.onInit();

    // Init picture state
    picture = argument["picture"];

    // Init camera state
    camera = argument["camera"];
    camera.pausePreview();

    // Reshow status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    camera.resumePreview();

    // Hide status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }
}
