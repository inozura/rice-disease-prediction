import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tflite/tflite.dart';

class PreviewController extends GetxController {
  //TODO: Implement PreviewController
  dynamic arguments = Get.arguments;
  late CameraController camera;
  late XFile picture;
  dynamic results;
  List resultTraining = [];

  @override
  void onInit() async {
    super.onInit();

    // Init picture state
    picture = arguments["picture"];

    // Init camera state
    camera = arguments["camera"];
    camera.pausePreview();

    // Init model
    await Tflite.loadModel(
        model: "assets/model/model.tflite", labels: "assets/model/labels.txt");

    // Reshow status bar
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    camera.resumePreview();
    Tflite.close();
    // Hide status bar
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  void predictImage() async {
    var output = await Tflite.runModelOnImage(
      path: picture.path,
      numResults: 3,
      threshold: 0.1,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    dynamic mapOutput = output![0];
    print(mapOutput);
    double confidenceOutput = mapOutput["confidence"];
    double confidenceSplit = (1 - confidenceOutput) / 2;

    if (mapOutput["index"] == 0) {
      resultTraining = [
        {
          "confidence": confidenceOutput.toStringAsFixed(2),
          "index": 0,
          "label": "Leaf Blight"
        },
        {
          "confidence": confidenceSplit.toStringAsFixed(2),
          "index": 1,
          "label": "Brown Spot"
        },
        {
          "confidence": confidenceSplit.toStringAsFixed(2),
          "index": 2,
          "label": "Leaf Smut"
        },
      ];
    } else if (mapOutput["index"] == 1) {
      resultTraining = [
        {
          "confidence": confidenceOutput.toStringAsFixed(2),
          "index": 1,
          "label": "Brown Spot"
        },
        {
          "confidence": confidenceSplit.toStringAsFixed(2),
          "index": 0,
          "label": "Leaf Blight"
        },
        {
          "confidence": confidenceSplit.toStringAsFixed(2),
          "index": 2,
          "label": "Leaf Smut"
        },
      ];
    } else if (mapOutput["index"] == 2) {
      resultTraining = [
        {
          "confidence": confidenceOutput.toStringAsFixed(2),
          "index": 2,
          "label": "Leaf Smut"
        },
        {
          "confidence": confidenceSplit.toStringAsFixed(2),
          "index": 0,
          "label": "Leaf Blight"
        },
        {
          "confidence": confidenceSplit.toStringAsFixed(2),
          "index": 1,
          "label": "Brown Spot"
        },
      ];
    }
    print(resultTraining);
    Get.toNamed("/result",
        arguments: {"picture": picture, "result": resultTraining});
  }
}
