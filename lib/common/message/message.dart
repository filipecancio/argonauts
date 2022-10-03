import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:argonauts/common/space/space_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Message extends StatefulWidget {
  late bool small;
  late String text;

  Message({this.small = false, this.text = ""});

  @override
  _MessageState createState() => _MessageState(small: this.small);
}

class _MessageState extends State<Message> {
  late bool small;

  _MessageState({required this.small}) {}

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: TextStyle(
          fontSize: small ? 20.0 : 30.0,
          fontFamily: 'Roboto',
        ),
        child: AnimatedTextKit(
          isRepeatingAnimation: false,
          animatedTexts: [
            TypewriterAnimatedText(widget.text,
                speed: Duration(milliseconds: 100))
          ],
          onFinished: () {
            Get.find<SpaceController>().show(Icons.arrow_forward_ios_rounded);
            dispose();
          },
        ));
  }
}
