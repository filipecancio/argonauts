import 'package:argonauts/common/analyser/analyser.dart';
import 'package:argonauts/common/spaceship/spaceship_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class Spaceship extends GetView<SpaceshipController> {
  const Spaceship({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 40, top: 100),
      child: Obx(() => controller.visible.value
          ? ScaleTransition(
              scale: controller.animation,
              child: Stack(children: [
                Center(
                    child: Obx(() => Image(
                        image: AssetImage(controller.state.value == 0
                            ? "assets/spaceship_01.png"
                            : controller.state.value == 1
                                ? "assets/spaceship_02.png"
                                : controller.state.value == 2
                                    ? "assets/spaceship_03.png"
                                    : "assets/spaceship_04.png")))),
                Container(
                    child: Padding(
                        padding:
                            EdgeInsets.only(top: 180, left: 110, right: 115),
                        child: Analyser())),
                Obx(() => controller.state.value != 0
                    ? Container(
                        padding:
                            EdgeInsets.only(top: 430, left: 150, right: 150),
                        child: Obx(() => Image(
                            image: AssetImage(controller.state.value == 0
                                ? "assets/organism_01.png"
                                : controller.state.value == 1
                                    ? "assets/organism_01.png"
                                    : controller.state.value == 2
                                        ? "assets/organism_02.png"
                                        : "assets/organism_03.png"))))
                    : Container()),
                Obx(() => controller.state.value != 0
                    ? Container(
                        padding:
                            EdgeInsets.only(top: 488, left: 140, right: 140),
                        child: Obx(() => Image(
                            colorBlendMode: BlendMode.lighten,
                            image: AssetImage(controller.state.value == 0
                                ? "assets/organism_01.png"
                                : controller.state.value == 1
                                    ? "assets/organism_01.png"
                                    : controller.state.value == 2
                                        ? "assets/organism_02.png"
                                        : "assets/organism_03.png"))))
                    : Container()),
              ]))
          : Container()),
    );
  }
}
