import 'dart:io';

import 'package:argonauts/common/argonaut/argonaut_controller.dart';
import 'package:argonauts/common/message/message.dart';
import 'package:argonauts/common/message/message_controller.dart';
import 'package:argonauts/common/space/space_controller.dart';
import 'package:argonauts/common/spaceship/spaceship_controller.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlowController extends GetxController {
  late BuildContext context;

  FlowController({required this.context});

  var spaceContoller = Get.find<SpaceController>();
  var argonautContoller = Get.find<ArgonautController>();
  var messageContoller = Get.find<MessageController>();
  var spaceshipController = Get.find<SpaceshipController>();

  late List<VoidCallback> flow;

  @override
  void onInit() async {
    spaceshipController.visible.value = false;
    spaceContoller.zoomIn();
    argonautContoller.back();
    spaceContoller.show(Icons.play_arrow);
    messageContoller.show([
      "In a far quadrant of the universe",
      "You are happy!",
      "you are coming home..."
    ]);

    flow = [
      () {
        spaceshipController.visible.value = true;
        //Tela inicial
        spaceContoller.hide();
        spaceContoller.zoomIn();
        argonautContoller.state.value = true;
      },
      () {
        //Tela teste
        spaceContoller.zoomOut();
        messageContoller.show([
          "In a far quadrant of the universe",
          "You are happy!",
          "you are coming home..."
        ]);
        argonautContoller.state.value = false;
      },
      () {
        spaceContoller.hyperspeed.value = true;
      },
      () {
        spaceContoller.hyperspeed.value = false;
      },
      () {
        //Tela final
        spaceContoller.zoomIn();
        argonautContoller.state.value = false;
      },
    ];
  }

  int i = 0;

  next() {
    flow[i]();
    i++;
  }
}
