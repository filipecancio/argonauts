import 'package:argonauts/common/spaceship/spaceship_controller.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SpaceController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  var size = 300.0;

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
}
