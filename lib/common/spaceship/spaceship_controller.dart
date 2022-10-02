import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpaceshipController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void onInit() async {
    animationController = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = Tween(
      begin: Offset.zero,
      end: const Offset(0, -1),
    ).animate(animationController);
  }

  void Switch() {
    if (animationController.isCompleted) {
      animationController.reverse();
    } else {
      animationController.forward();
    }

    //animationController.forward();
  }

  void hide() {
    //animationController.reverse();
  }
}
