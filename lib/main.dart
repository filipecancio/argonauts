import 'package:argonauts/common/analyser/analyser_controller.dart';
import 'package:argonauts/common/argonaut/argonaut_controller.dart';
import 'package:argonauts/common/space/space.dart';
import 'package:argonauts/common/space/space_controller.dart';
import 'package:argonauts/common/spaceship/spaceship_controller.dart';
import 'package:argonauts/flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

void main() => runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyRiveAnimation(),
    ));

class MyRiveAnimation extends StatelessWidget {
  late FlowController controller;
  @override
  Widget build(BuildContext context) {
    Get.put(ArgonautController());
    Get.put(AnalyserController());
    Get.put(SpaceshipController());
    Get.put(SpaceController());

    controller = FlowController(context: context);
    Get.put(controller);

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
