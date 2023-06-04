import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart' as CameraLib;

class CameraController extends GetxController {
  //TODO: Implement CameraController
  dynamic argument = Get.arguments;
  final camera = Rxn<CameraLib.CameraController>();
  RxBool isRearCameraSelected = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
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
  void onClose() {
    super.onClose();
    if (argument != null && argument["camera"].length > 0) {
      camera.value!.dispose();
    }
  }

  void changeCameraRear() {
    isRearCameraSelected.value = !isRearCameraSelected.value;
    initCamera(isRearCameraSelected.value
        ? argument["camera"]![0]
        : argument["camera"]![1]);
  }

  Future takePicture() async {
    if (!camera.value!.value.isInitialized) {
      return null;
    }
    if (camera.value!.value.isInitialized) {
      return null;
    }
    try {
      await camera.value!.setFlashMode(CameraLib.FlashMode.off);
      CameraLib.XFile picture = await camera.value!.takePicture();
      Get.toNamed("/preview", arguments: {"picture": picture});
    } on CameraLib.CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  Future initCamera(CameraLib.CameraDescription cameraDescription) async {
    camera.value = CameraLib.CameraController(
        cameraDescription, CameraLib.ResolutionPreset.high);
    try {
      await camera.value!.initialize();
    } on CameraLib.CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }
}
