import 'package:argonauts/flow_controller.dart';
import 'package:get/get.dart';

class End {
  flow() {
    FlowController c = Get.find<FlowController>();

    return [
      () {
        c.spaceContoller.hyperspeed.value = false;
        c.spaceContoller.hide();
        c.argonautContoller.back();
        c.spaceContoller.zoomIn();

        c.spaceshipController.visible.value = false;
        c.spaceContoller.planet.value = 4;

        c.spaceContoller.write(
          "Finally whe're home!",
        );
      },
      () {
        c.spaceContoller.write(
          "Our friends at NASA would be proud of us!",
        );
      },
    ];
  }
}
