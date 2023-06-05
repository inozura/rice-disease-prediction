import 'package:get/get.dart';

import '../modules/camera/bindings/camera_binding.dart';
import '../modules/camera/views/camera_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/preview/bindings/preview_binding.dart';
import '../modules/preview/views/preview_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.CAMERA,
        page: () => const CameraView(),
        binding: CameraBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: _Paths.PREVIEW,
        page: () => const PreviewView(),
        binding: PreviewBinding(),
        transition: Transition.rightToLeftWithFade),
  ];
}
