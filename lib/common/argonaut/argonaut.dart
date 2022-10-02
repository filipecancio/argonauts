import 'package:argonauts/common/argonaut/argonaut_controller.dart';
import 'package:argonauts/common/argonaut/argonaut_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Argonaut extends GetView<ArgonautController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 0, bottom: 60, right: 160),
        child: SlideTransition(
          child: Image(image: AssetImage(controller.path)),
          position: controller.animation,
        ));
  }
}
