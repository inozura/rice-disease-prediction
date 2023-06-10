import 'dart:io';

import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:rice_prediction/constant/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:math' as math;

import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  const ResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ResultController controller = Get.put(ResultController());

    return Scaffold(
        backgroundColor: const Color(backgroundColor),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(File(controller.picture.path)),
                      fit: BoxFit.fill)),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 25, bottom: 25, left: 30, right: 30),
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 150,
                    decoration: BoxDecoration(
                        color: const Color(backgroundColor),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            spreadRadius: 5,
                            blurRadius: 15,
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Result",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Countup(
                                begin: 0,
                                end: 90,
                                duration: const Duration(seconds: 2),
                                separator: ',',
                                style: const TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Color(primary)),
                              ),
                              const Text(
                                "%",
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bacterial leaf blight",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black.withAlpha(100)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
            SlidingUpPanel(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              // minHeight: MediaQuery.of(context).size.height * 0.8,
              snapPoint: 0.35,
              backdropEnabled: true,
              backdropOpacity: 0.3,
              defaultPanelState: PanelState.CLOSED,
              isDraggable: true,
              backdropTapClosesPanel: false,
              backdropColor: const Color(backgroundColor),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, -7),
                  spreadRadius: 5,
                  blurRadius: 15,
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                )
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              onPanelSlide: (position) {
                if (position > 0.3) {
                  controller.changeOpenDialog(true);
                }
                if (position < 0.3) {
                  controller.changeOpenDialog(false);
                }
              },
              panel: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
                child: Stack(children: [
                  Positioned(
                    left: 10,
                    top: -170,
                    child: Transform.rotate(
                      angle: math.pi / 25,
                      child: SvgPicture.asset(
                        'assets/svg/rice_leaf.svg',
                        width: 800,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          margin: const EdgeInsets.only(bottom: 30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 5,
                                    width: 20,
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        color: Colors.black26),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Detail",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Your wish in here",
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        // LIST VIEW
                        Container(
                          height: 110,
                          child: ListView(
                            padding: const EdgeInsets.only(
                                left: 20, bottom: 3, top: 3),
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              // BLIGHT
                              Container(
                                margin: const EdgeInsets.only(right: 19.2),
                                padding: const EdgeInsets.all(10),
                                height: 90,
                                width: 148,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Colors.black45.withOpacity(0.2),
                                          spreadRadius: 0,
                                          blurRadius: 3,
                                          offset: const Offset(1, 2))
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Bacterial leaf blight",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color:
                                                  Colors.black.withAlpha(100)),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "90",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 24,
                                                color: Color(primary)),
                                          ),
                                          Text(
                                            "%",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 24,
                                                color: Colors.black
                                                    .withAlpha(200)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              // Brownspot
                              Container(
                                margin: const EdgeInsets.only(right: 19.2),
                                padding: const EdgeInsets.all(10),
                                height: 90,
                                width: 148,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Colors.black45.withOpacity(0.2),
                                          spreadRadius: 0,
                                          blurRadius: 3,
                                          offset: const Offset(1, 2))
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Brownspot",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color:
                                                  Colors.black.withAlpha(100)),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "5",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 24,
                                                color: Color(primary)),
                                          ),
                                          Text(
                                            "%",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 24,
                                                color: Colors.black
                                                    .withAlpha(200)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              //
                              Container(
                                margin: const EdgeInsets.only(right: 19.2),
                                padding: const EdgeInsets.all(10),
                                height: 90,
                                width: 148,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Colors.black45.withOpacity(0.2),
                                          spreadRadius: 0,
                                          blurRadius: 3,
                                          offset: const Offset(1, 2))
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Brownspot",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color:
                                                  Colors.black.withAlpha(100)),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "5",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 24,
                                                color: Color(primary)),
                                          ),
                                          Text(
                                            "%",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 24,
                                                color: Colors.black
                                                    .withAlpha(200)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            // BUTTON
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                bottom: controller.isOpenDialog.value ? 30 : -30,
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () => {
                    Get.toNamed("/result",
                        arguments: {"picture": controller.picture})
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
                    "TRY AGAIN",
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
