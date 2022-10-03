import 'package:argonauts/common/analyser/analyser_controller.dart';
import 'package:argonauts/common/analyser/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class Analyser extends GetView<AnalyserController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: RiveAnimation.asset(
      "assets/analyser.riv",
    ));
  }
}
