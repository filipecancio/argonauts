import 'package:argonauts/common/analyser/analyser_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class Analyser extends GetView<AnalyserController> {
  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      "assets/analyser.riv",
    );
  }
}
