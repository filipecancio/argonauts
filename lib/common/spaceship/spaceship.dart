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
    return ScaleTransition(
        scale: controller.animation,
        child: Stack(children: [
          Center(child: Image(image: AssetImage(controller.path))),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(top: 270, left: 92, right: 90),
                  child: Analyser())),
        ]));
  }
}
