import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ArgonautController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late bool state;
  late Animation<Offset> animation;

  @override
  void onInit() async {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(days: 3),
    )..repeat();

    animation = Tween(
      begin: Offset.zero,
      end: const Offset(0, 0.8),
    ).animate(animationController);

    super.onInit();
  }
}
