import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:argonauts/common/message/message_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Message extends GetView<MessageController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 30.0,
            fontFamily: 'Roboto',
          ),
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TypewriterAnimatedText("MENSAGEM DE TESTE",
                  speed: Duration(milliseconds: 100))
            ],
            pause: Duration(seconds: 2),
          )),
    );
  }
}
