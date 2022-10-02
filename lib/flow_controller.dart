import 'package:argonauts/common/spaceship/spaceship_controller.dart';
import 'package:get/get.dart';

class FlowController extends GetxController {
  next() {
    Get.find<SpaceshipController>().Switch();
  }
}
