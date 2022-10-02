import 'package:argonauts/common/argonaut/argonaut_controller.dart';
import 'package:argonauts/common/argonaut/argonaut_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Argonaut extends GetView<ArgonautController> {
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      child: SvgPicture.asset("/assets/argonaut_back.svg"),
      position: controller.animation,
    );
  }
}
