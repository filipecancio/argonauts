import 'package:argonauts/common/argonaut/argonaut_controller.dart';
import 'package:argonauts/common/space/space.dart';
import 'package:argonauts/common/spaceship/spaceship_controller.dart';
import 'package:argonauts/flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

void main() => runApp(GetMaterialApp(
      home: MyRiveAnimation(),
    ));

class MyRiveAnimation extends StatelessWidget {
  late FlowController controller;
  @override
  Widget build(BuildContext context) {
    controller = FlowController();
    Get.put(controller);
    Get.put(ArgonautController());
    Get.put(SpaceshipController());

    return Scaffold(
        body: GestureDetector(
      onTap: () => controller.next(),
      child: Stack(
        children: [
          Space(),
        ],
      ),
    ));
  }
}
