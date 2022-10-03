import 'package:argonauts/common/analyser/details.dart';
import 'package:argonauts/flow/organism.dart';
import 'package:argonauts/flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Hiperspeed {
  flow() {
    FlowController c = Get.find<FlowController>();
    return [
      () {
        c.spaceContoller.hyperspeed.value = true;
        c.spaceContoller.write("We are almost there!");
      },
    ];
  }
}
