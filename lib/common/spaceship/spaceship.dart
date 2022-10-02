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
    return Obx(() => controller.visible.value
        ? ScaleTransition(
            scale: controller.animation,
            child: Stack(children: [
              Center(child: Image(image: AssetImage(controller.path))),
              Container(
                  child: Padding(
                      padding: EdgeInsets.only(top: 190, left: 160, right: 158),
                      child: Analyser())),
            ]))
        : Container());
  }
}
