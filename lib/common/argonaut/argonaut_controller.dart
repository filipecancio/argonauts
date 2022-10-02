import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ArgonautController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late RxBool state = false.obs;
  late Animation<Offset> animation;

  @override
  void onInit() async {
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

  front() {
    state.value = true;
  }

  back() {
    state.value = false;
  }
}
