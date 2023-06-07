import 'dart:io';

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
            SlidingUpPanel(
              maxHeight: MediaQuery.of(context).size.height * 0.4,
              minHeight: MediaQuery.of(context).size.height * 0.8,
              backdropEnabled: true,
              backdropOpacity: 0.3,
              defaultPanelState: PanelState.OPEN,
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
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              panel: Stack(children: [
                Positioned(
                  left: 10,
                  bottom: -150,
                  child: Transform.rotate(
                    angle: math.pi / 25,
                    child: SvgPicture.asset(
                      'assets/svg/rice_leaf.svg',
                      width: 800,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      color: Colors.black26),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Result",
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
                          padding: EdgeInsets.only(left: 20, bottom: 3, top: 3),
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            // BLIGHT
                            Container(
                              margin: EdgeInsets.only(right: 19.2),
                              padding: EdgeInsets.all(10),
                              height: 90,
                              width: 148,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45.withOpacity(0.2),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: Offset(1, 2))
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
                                            color: Colors.black.withAlpha(100)),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "40",
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
                                              color:
                                                  Colors.black.withAlpha(200)),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),

                            // Brownspot
                            Container(
                              margin: EdgeInsets.only(right: 19.2),
                              padding: EdgeInsets.all(10),
                              height: 90,
                              width: 148,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45.withOpacity(0.2),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: Offset(1, 2))
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
                                            color: Colors.black.withAlpha(100)),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
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
                                              color:
                                                  Colors.black.withAlpha(200)),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),

                            //
                            Container(
                              margin: EdgeInsets.only(right: 19.2),
                              padding: EdgeInsets.all(10),
                              height: 90,
                              width: 148,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45.withOpacity(0.2),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: Offset(1, 2))
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
                                            color: Colors.black.withAlpha(100)),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
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
                                              color:
                                                  Colors.black.withAlpha(200)),
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
            // BUTTON
            Positioned(
              bottom: 30,
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
                    backgroundColor: MaterialStatePropertyAll(Color(primary))),
                child: const Text(
                  "TRY AGAIN",
                ),
              ),
            ),
          ],
        ));
  }
}
