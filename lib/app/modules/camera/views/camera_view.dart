import 'package:camera/camera.dart' as CameraLib;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/camera_controller.dart';

class CameraView extends GetView<CameraController> {
  const CameraView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    dynamic argument = Get.arguments;
    CameraController cameraController = Get.put(CameraController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('CameraView'),
        centerTitle: true,
      ),
      body: Stack(children: [
        Obx(() => (cameraController.camera.value != null &&
                controller.camera.value!.value.isInitialized)
            ? CameraLib.CameraPreview(
                cameraController.camera.value ?? argument["camera"]![0])
            : Container(
                color: Colors.black,
                child: const Center(child: CircularProgressIndicator()))),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  color: Colors.black),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                    child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 30,
                  icon: Obx(() => Icon(
                      cameraController.isRearCameraSelected.value
                          ? CupertinoIcons.switch_camera
                          : CupertinoIcons.switch_camera_solid,
                      color: Colors.white)),
                  onPressed: () => cameraController.changeCameraRear(),
                )),
                Expanded(
                    child: IconButton(
                  onPressed: () =>
                      print(cameraController.camera.value!.value.isInitialized),
                  iconSize: 50,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.circle, color: Colors.white),
                )),
                const Spacer(),
              ]),
            )),
      ]),
    );
  }
}
