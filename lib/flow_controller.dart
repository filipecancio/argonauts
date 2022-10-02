import 'dart:io';

import 'package:argonauts/common/argonaut/argonaut_controller.dart';
import 'package:argonauts/common/message/message.dart';
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
  var spaceshipController = Get.find<SpaceshipController>();

  late List<VoidCallback> flow;

  @override
  void onInit() async {
    spaceContoller.zoomIn();
    argonautContoller.back();
    spaceContoller.show(Icons.play_arrow);
    flow = [
      () {
        //Tela inicial
        spaceContoller.zoomIn();
        MessageController.showCustomToast(context, "message");
        argonautContoller.state.value = true;
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
