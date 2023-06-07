import 'package:camera/camera.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  //TODO: Implement ResultController
  dynamic arguments = Get.arguments;
  late XFile picture;

  @override
  void onInit() {
    super.onInit();

    // Init picture state
    picture = arguments["picture"];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
