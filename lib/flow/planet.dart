import 'package:argonauts/common/analyser/details.dart';
import 'package:argonauts/flow/organism.dart';
import 'package:argonauts/flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class Planet {
  late String name;
  late String text;
  late int id;
  late Organism organism;
  Planet(
      {required this.name,
      required this.id,
      required this.text,
      required this.organism}) {}

  flow() {
    FlowController c = Get.find<FlowController>();
    return [
      () {
        c.spaceContoller.hyperspeed.value = false;
        c.spaceContoller.hide();
        c.argonautContoller.back();
        c.spaceContoller.zoomIn();

        c.spaceshipController.visible.value = false;
        c.spaceContoller.planet.value = id;

        c.spaceContoller.write(
          "Look, we've reached $name!",
        );
      },
      () {
        showDialog(
            context: Get.context!,
            builder: (BuildContext context) {
              return CustomDialogBox(
                title: name,
                descriptions: text,
                text: "Continue",
                rive: RiveAnimation.asset(id == 0
                    ? "assets/planet_random.riv"
                    : id == 1
                        ? "assets/planet_mercury.riv"
                        : id == 2
                            ? "assets/planet_venus.riv"
                            : id == 3
                                ? "assets/planet_mars.riv"
                                : "assets/planet_earth.riv"),
              );
            });
      },
      () {
        c.argonautContoller.front();
        c.spaceContoller.write("Our probes have found life!");
      },
      () {
        c.spaceshipController.state.value = id;
        c.spaceshipController.visible.value = true;
        c.spaceContoller.zoomOut();
        c.spaceContoller
            .write("They are microorganism of the species ${organism.name}!");
      },
      () {
        c.spaceContoller
            .write("They showed resistance to ${organism.resistance}!");
      },
      () {
        showDialog(
            context: Get.context!,
            builder: (BuildContext context) {
              return CustomDialogBox(
                title: organism.name,
                descriptions: organism.text,
                link: organism.link,
                text: "Continue",
                img: Image.asset(id == 1
                    ? "assets/organism_01.png"
                    : id == 2
                        ? "assets/organism_02.png"
                        : "assets/organism_03.png"),
              );
            });
      },
      () {
        showDialog(
            context: Get.context!,
            builder: (BuildContext context) {
              return CustomDialogBox(
                title: name,
                descriptions: text,
                text: "Continue",
                rive: RiveAnimation.asset(id == 1
                    ? "assets/organism_01.riv"
                    : id == 2
                        ? "assets/organism_02.riv"
                        : "assets/organism_03.riv"),
              );
            });
      },
      () {
        c.argonautContoller.back();

        c.spaceContoller.write("Starting our new route...");
      },
    ];
  }
}
