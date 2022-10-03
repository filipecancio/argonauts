import 'package:argonauts/common/spaceship/spaceship_controller.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:get/get.dart';

class SpaceController extends GetxController with GetTickerProviderStateMixin {
  late FlutterGifController gif;

  late AnimationController animationController;

  late Animation<double> animation;

  var size = 300.0;
  var hidden = true.obs;
  var position = true.obs;
  late RxInt planet = 0.obs;

  Rx<IconData> icon = Icons.arrow_forward_ios.obs;

  RxBool hyperspeed = false.obs;

  RxString text = " ".obs;
  RxBool organism = false.obs;

  @override
  void onInit() async {
    gif = FlutterGifController(vsync: this);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween(
      begin: 0.5,
      end: 1.0,
    ).animate(animationController);
  }

  @override
  void dispose() {
    gif.dispose();
    super.dispose();
  }

  void zoomIn() {
    Get.find<SpaceshipController>().zoomIn();
    animationController.forward();
    position.value = false;
  }

  void zoomOut() {
    Get.find<SpaceshipController>().zoomOut();
    animationController.reverse();
    position.value = true;
  }

  void show(IconData icon) {
    hidden.value = false;
    this.icon.value = icon;
  }

  void hide() {
    hidden.value = true;
  }

  void write(
    String text,
  ) {
    this.text.value = text;
    update();
    Get.find<SpaceController>().show(Icons.arrow_forward_ios);
  }
}
