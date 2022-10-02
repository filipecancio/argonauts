import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  late RxList<String> text;
  late RxList<AnimatedText> textAnimated;

  MessageController() {
    text = [""].obs;
    textAnimated =
        [TypewriterAnimatedText("Olá", speed: Duration(milliseconds: 100))].obs;
    _makeAnimations();
  }

  @override
  void onInit() {
    super.onInit();
  }

  void show(List<String> list) {
    text.clear();
    text.addAll(list);
    update();
  }

  void _makeAnimations() {
    textAnimated.clear();
    for (String t in text.value) {
      textAnimated
          .add(TypewriterAnimatedText(t, speed: Duration(milliseconds: 100)));
    }
  }
}
