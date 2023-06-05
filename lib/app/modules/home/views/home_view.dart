import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:rice_prediction/constant/colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: const Color(backgroundColor),
      body: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                left: -60,
                top: 50,
                child: Transform.rotate(
                  angle: math.pi / 6,
                  child: SvgPicture.asset(
                    'assets/svg/leaf.svg',
                    width: 150,
                  ),
                ),
              ),
              Positioned(
                left: -10,
                top: 0,
                child: Transform.rotate(
                  angle: math.pi / 25,
                  child: SvgPicture.asset(
                    'assets/svg/leaf.svg',
                    width: 150,
                  ),
                ),
              ),
              Positioned(
                right: -160,
                bottom: -30,
                child: Transform.rotate(
                  angle: math.pi / 25,
                  child: SvgPicture.asset(
                    'assets/svg/rice_leaf.svg',
                    width: 450,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.topRight,
                        child: const Text("v1.0")),
                    Container(
                        alignment: Alignment.topRight,
                        child: const Text("Novandra")),
                  ],
                ),
              ),
              Column(
                children: [
                  const Text(
                    "Classification of\n rice leaf diseases",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 70),
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/png/hand_w_plant.png',
                      width: 250,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                  onPressed: () async => {
                    await availableCameras().then((value) =>
                        Get.toNamed("/camera", arguments: {"camera": value}))
                  },
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                      textStyle:
                          MaterialStatePropertyAll(TextStyle(fontSize: 20)),
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.fromLTRB(30, 10, 30, 10)),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(primary))),
                  child: const Text(
                    "START YOUR JOURNEY",
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
