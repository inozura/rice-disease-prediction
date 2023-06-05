import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rice_prediction/constant/colors.dart';

import '../controllers/preview_controller.dart';

class PreviewView extends GetView<PreviewController> {
  const PreviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PreviewController controller = Get.put(PreviewController());

    return Scaffold(
      backgroundColor: const Color(backgroundColor),
      body: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                right: -60,
                top: 50,
                child: Transform.scale(
                  scaleX: -1,
                  child: Transform.rotate(
                    angle: math.pi / 6,
                    child: SvgPicture.asset(
                      'assets/svg/leaf.svg',
                      width: 150,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -10,
                top: 0,
                child: Transform.scale(
                  scaleX: -1,
                  child: Transform.rotate(
                    angle: math.pi / 25,
                    child: SvgPicture.asset(
                      'assets/svg/leaf.svg',
                      width: 150,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 20, left: 10),
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(primary),
                      ))),
              Column(
                children: [
                  const Text(
                    "Are sure to \nprocess this image?",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 0),
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            spreadRadius: 10,
                            blurRadius: 15,
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                          )
                        ],
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: FileImage(File(controller.picture.path)))),
                  ),
                ],
              ),
              const Text(
                  textAlign: TextAlign.center,
                  "! Process can take a few seconds and may\n make your device heating, because classification\n process in the background"),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () async => {},
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
                    "PROCESS THIS IMAGE",
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
