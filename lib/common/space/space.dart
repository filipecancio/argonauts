import 'package:argonauts/common/argonaut/argonaut.dart';
import 'package:argonauts/common/message/message.dart';
import 'package:argonauts/common/space/space_controller.dart';
import 'package:argonauts/common/space/star.dart';
import 'package:argonauts/common/space/star_field.dart';
import 'package:argonauts/common/spaceship/spaceship.dart';
import 'package:argonauts/flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class Space extends GetView<SpaceController> {
  Widget build(BuildContext context) {
    controller.gif.repeat(min: 0, max: 40, period: Duration(seconds: 3));

    return Scaffold(
      body: Stack(
        children: [
          Obx(() => controller.hyperspeed.value
              ? Positioned(
                  top: 0,
                  bottom: 150,
                  left: -50,
                  right: -50,
                  child: GifImage(
                      controller: controller.gif,
                      image: AssetImage("assets/hyperspace.gif")))
              : StarField()),
          Center(
              child: ScaleTransition(
            scale: controller.animation,
            child: Stack(
              children: [
                Obx(() => controller.hyperspeed.value
                    ? Container()
                    : Obx(() => RiveAnimation.asset(controller.planet.value == 0
                        ? "assets/planet_random.riv"
                        : controller.planet.value == 1
                            ? "assets/planet_mercury.riv"
                            : controller.planet.value == 2
                                ? "assets/planet_venus.riv"
                                : controller.planet.value == 3
                                    ? "assets/planet_mars.riv"
                                    : "assets/planet_earth.riv"))),
                Argonaut()
              ],
            ),
          )),
          Spaceship(),
          Positioned(
              bottom: 24,
              right: 24,
              child: GestureDetector(
                  onTap: () => Get.find<FlowController>().next(),
                  child: Obx(() => controller.hidden.value
                      ? Container()
                      : Icon(
                          size: 50,
                          controller.icon.value,
                          color: Colors.white,
                        )))),
          Obx(() => Positioned(
              bottom: controller.position.value ? 650 : 150,
              left: controller.position.value ? 80 : 24,
              child: SizedBox(
                  width: controller.position.value ? 250 : 290,
                  child: Obx(() {
                    var msg = Text(
                      "${controller.text}",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: controller.position.value ? 18 : 30,
                          fontWeight: FontWeight.w600),
                    );
                    return msg;
                  }))))
        ],
      ),
    );
  }

  @override
  dispose() {
    controller.gif.dispose(); // you need this
  }
}
