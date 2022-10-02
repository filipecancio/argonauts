import 'package:argonauts/common/spaceship/spaceship_controller.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:get/get.dart';

class SpaceController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  var size = 300.0;
  var hidden = true.obs;
  Rx<IconData> icon = Icons.arrow_forward_ios.obs;
  @override
  void onInit() async {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween(
      begin: 0.5,
      end: 1.0,
    ).animate(animationController);
  }

  void zoomIn() {
    Get.find<SpaceshipController>().zoomIn();
    animationController.forward();
  }

  void zoomOut() {
    Get.find<SpaceshipController>().zoomOut();
    animationController.reverse();
  }

  void show(IconData icon) {
    hidden.value = false;
    this.icon.value = icon;
  }

  void hide() {
    hidden.value = true;
  }
}
