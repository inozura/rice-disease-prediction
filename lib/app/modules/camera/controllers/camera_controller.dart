import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart' as CameraLib;

class CameraController extends GetxController {
  //TODO: Implement CameraController
  dynamic argument = Get.arguments;
  late CameraLib.CameraController camera;
  RxBool isRearCameraSelected = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    // Hidding Status bar by system
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Camera initial logic
    if (argument == null || argument["camera"].length == 0) {
      Get.snackbar("ERROR", "Camera module not found or not approved",
          snackPosition: SnackPosition.BOTTOM);
      Get.offNamed("/home");
    }
    if (argument != null && argument["camera"].length > 0) {
      initCamera(argument["camera"]![0]);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    closeScreen();
  }

  void closeScreen() {
    // Reshow status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    camera.dispose();
  }

  void changeCameraRear() async {
    isRearCameraSelected.value = !isRearCameraSelected.value;
    initCamera(isRearCameraSelected.value
        ? argument["camera"]![0]
        : argument["camera"]![1]);

    if (isRearCameraSelected.value) {
      await camera.lockCaptureOrientation();
    }
  }

  Future takePicture() async {
    if (!camera.value.isInitialized) {
      return null;
    }

    try {
      await camera.setFlashMode(CameraLib.FlashMode.off);
      print(camera);
      CameraLib.XFile picture = await camera.takePicture();
      Get.toNamed("/preview",
          arguments: {"picture": picture, "camera": camera});
    } on CameraLib.CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  Future initCamera(CameraLib.CameraDescription cameraDescription) async {
    camera = CameraLib.CameraController(
        cameraDescription, CameraLib.ResolutionPreset.high);
    try {
      await camera.initialize().then((_) {
        print("initialize");
        update();
      });
    } on CameraLib.CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }
}
