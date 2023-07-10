import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rice_prediction/constant/suggestion.dart';

class ResultController extends GetxController {
  //TODO: Implement ResultController
  dynamic arguments = Get.arguments;
  RxBool isOpenDialog = false.obs;
  RxBool isFullExpanded = false.obs;
  late XFile picture;
  late List<dynamic> result;
  late String suggestion = "Leaf Blight";

  @override
  void onInit() async {
    super.onInit();

    // Init picture and result state
    picture = arguments["picture"];
    result = arguments["result"];

    // Init suggestion content
    if (result[0]["label"] == "Leaf Blight") {
      suggestion = handlingAdvice[0]["content"];
    } else if (result[0]["label"] == "Brown Spot") {
      suggestion = handlingAdvice[1]["content"];
    } else if (result[0]["label"] == "Leaf Smut") {
      suggestion = handlingAdvice[2]["content"];
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeOpenDialog(bool value) {
    isOpenDialog.value = value;
  }

  void changeFullExpanded(bool value) {
    isFullExpanded.value = value;
  }
}
