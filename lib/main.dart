import 'package:argonauts/common/argonaut/argonaut_controller.dart';
import 'package:argonauts/common/space/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

void main() => runApp(GetMaterialApp(
      home: MyRiveAnimation(),
    ));

class MyRiveAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ArgonautController());
    return Scaffold(
      body: Stack(
        children: [
          Space(),
        ],
      ),
    );
  }
}
