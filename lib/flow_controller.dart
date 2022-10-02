import 'package:argonauts/common/space/space_controller.dart';
import 'package:argonauts/common/spaceship/spaceship_controller.dart';
import 'package:get/get.dart';

class FlowController extends GetxController {
  bool zoomed = true;

  next() {
    if (zoomed) {
      Get.find<SpaceController>().zoomIn();
    } else {
      Get.find<SpaceController>().zoomOut();
    }
    zoomed = !zoomed;
  }
}
