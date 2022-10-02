import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpaceshipController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late String path;

  @override
  void onInit() async {
    path = "assets/spaceship.png";

    animationController = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = Tween(
      begin: 2.5,
      end: 14.0,
    ).animate(animationController);
  }

  void zoomIn() {
    animationController.forward();
  }

  void zoomOut() {
    animationController.reverse();
  }
}
