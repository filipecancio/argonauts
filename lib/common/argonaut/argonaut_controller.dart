import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ArgonautController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late bool state;
  late String path;
  late Animation<Offset> animation;

  @override
  void onInit() async {
    path = "assets/argonaut_back.png";
    state = false;

    animationController = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    animation = Tween(
      begin: Offset.zero,
      end: const Offset(0, 0.1),
    ).animate(animationController);

    super.onInit();
  }

  changeState() {
    state = !state;
    if (state) {
      path = "assets/argonaut_front.png";
    } else {
      path = "assets/argonaut_back.png";
    }
  }
}
