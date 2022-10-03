import 'package:argonauts/common/analyser/details.dart';
import 'package:argonauts/flow/organism.dart';
import 'package:argonauts/flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Start {
  flow() {
    FlowController c = Get.find<FlowController>();
    return [
      () {
        c.spaceContoller.zoomIn();
        c.spaceContoller.hide();
        c.argonautContoller.state.value = true;
        c.spaceshipController.visible.value = true;
        c.spaceContoller.write("Phew!! We're done with the mission!");
        c.argonautContoller.back();
      },
      () {
        c.argonautContoller.front();
        c.spaceContoller.write("Let's take a shortcut through hyperspace");
      },
      () {
        c.argonautContoller.back();
        c.spaceContoller.write("Let me just...");
        c.spaceContoller.show(Icons.play_arrow);
      },
      () {
        c.spaceContoller.hide();
        c.argonautContoller.front();
        c.spaceContoller.zoomOut();
        c.argonautContoller.animationController.forward();
        c.spaceContoller.write("HEY, What did you do?");
      },
      () {
        c.spaceContoller.hide();
        c.argonautContoller.back();
        c.spaceContoller.hyperspeed.value = true;
        c.argonautContoller.animationController.forward();
        c.spaceContoller.write("Help!");
      },
    ];
  }
}
