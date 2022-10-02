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
      SlideTransition(
        position: controller.animation,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: SizedBox(
              height: 60,
              child: Container(
                color: Colors.white,
              )),
        ),
      ),
    ]);
  }
}
