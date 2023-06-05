import 'package:get/get.dart';

import '../controllers/preview_controller.dart';

class PreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreviewController>(
      () => PreviewController(),
    );
  }
}
