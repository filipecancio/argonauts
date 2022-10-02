import 'package:argonauts/common/spaceship/spaceship_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class Spaceship extends GetView<SpaceshipController> {
  const Spaceship({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ScaleTransition(
          scale: controller.animation,
          child: Image(image: AssetImage(controller.path))),
    ]);
  }
}
