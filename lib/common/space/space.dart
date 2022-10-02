import 'package:argonauts/common/argonaut/argonaut.dart';
import 'package:argonauts/common/space/space_controller.dart';
import 'package:argonauts/common/space/star.dart';
import 'package:argonauts/common/space/star_field.dart';
import 'package:argonauts/common/spaceship/spaceship.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class Space extends GetView<SpaceController> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StarField(),
          Center(
              child: ScaleTransition(
            scale: controller.animation,
            child: Stack(
              children: [
                RiveAnimation.asset("assets/draw_order_demo_parallax.riv"),
                Argonaut()
              ],
            ),
          )),
          Expanded(
            child: Spaceship(),
          ),
          Positioned(
              bottom: 24,
              right: 24,
              child: Obx(() => controller.hidden.value
                  ? Container()
                  : Icon(
                      size: 50,
                      controller.icon.value,
                      color: Colors.white,
                    )))
        ],
      ),
    );
  }
}
