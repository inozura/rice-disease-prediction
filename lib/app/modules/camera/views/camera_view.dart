import 'dart:typed_data';

import 'package:camera/camera.dart' as CameraLib;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rice_prediction/constant/colors.dart';

import '../controllers/camera_controller.dart';

class CameraView extends GetView<CameraController> {
  const CameraView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CameraController cameraController = Get.put(CameraController());

    return Scaffold(
      body: Stack(children: [
        GetBuilder<CameraController>(
            builder: (controller) => CallCamera(controller)),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                color: Color(backgroundColor),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -7),
                    spreadRadius: 5,
                    blurRadius: 15,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                  )
                ],
              ),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 30,
                      icon: Obx(() => Icon(
                          cameraController.isRearCameraSelected.value
                              ? CupertinoIcons.switch_camera
                              : CupertinoIcons.switch_camera_solid,
                          color: const Color(grayIcon))),
                      onPressed: () => cameraController.changeCameraRear(),
                    )),
                    Expanded(
                        child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        IconButton(
                          onPressed: () => controller.takePicture(),
                          iconSize: 35,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.circle_sharp,
                              color: Color(grayIcon)),
                        ),
                        IconButton(
                          onPressed: () => controller.takePicture(),
                          iconSize: 60,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.circle_outlined,
                              color: Color(grayIcon)),
                        )
                      ],
                    )),
                    Expanded(
                        child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 30,
                      icon: const Icon(Icons.photo_library,
                          color: Color(grayIcon)),
                      onPressed: () => cameraController.pickImageFromGallery(),
                    )),
                  ]),
            )),
      ]),
    );
  }

  StatelessWidget CallCamera(CameraController controller) {
    if (controller.camera.value.isInitialized) {
      return CameraLib.CameraPreview(controller.camera);
    }

    return Container(
        color: Colors.black,
        child: const Center(child: CircularProgressIndicator()));
  }
}
