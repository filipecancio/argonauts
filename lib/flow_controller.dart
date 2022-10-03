import 'dart:io';

import 'package:argonauts/common/argonaut/argonaut_controller.dart';
import 'package:argonauts/common/message/message.dart';
import 'package:argonauts/common/space/space_controller.dart';
import 'package:argonauts/common/spaceship/spaceship_controller.dart';
import 'package:argonauts/flow/organism.dart';
import 'package:argonauts/flow/planet.dart';
import 'package:argonauts/flow/start.dart';
import 'package:argonauts/flow/transition.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlowController extends GetxController {
  late BuildContext context;

  FlowController({required this.context});

  var spaceContoller = Get.find<SpaceController>();
  var argonautContoller = Get.find<ArgonautController>();
  var spaceshipController = Get.find<SpaceshipController>();

  late List<VoidCallback> flow;
  @override
  void onInit() async {
    spaceshipController.visible.value = false;
    spaceContoller.zoomIn();
    argonautContoller.back();
    spaceContoller.show(Icons.play_arrow);
    spaceContoller.write("In a far quadrant of the universe...");

    Planet p1 = Planet(
        name: "Mercury",
        id: 1,
        text:
            "This planet is the closest to the sun in our solar system, so its temperatures reach up to 427 degrees Celsius, enough to melt tin. However, on the other side of the planet, where it is night, its temperature can reach -182 degrees celcius.",
        organism: Organism(
            name: "Deinococcus bacterium",
            text:
                "To survive this planet and its climatic variations, only one super-powerful organism. The Deinococcus bacterium, nicknamed \"Conan the Bacterium\" is highly resistant to solar radiation, and to very low temperatures. This bacteria can resist 3000 times the amount of radiation that would kill a human being.",
            link: "https://www.youtube.com/watch?v=GcQBgPHlReA",
            resistance: "high temperatures"));

    Planet p2 = Planet(
        name: "Venus",
        id: 2,
        text:
            "The atmosphere of the planet Venus comprises a layer of gases, with clouds of sulfuric acid and the air composed mostly of carbon dioxides.",
        organism: Organism(
            name: "Tardigrade",
            link: "https://www.youtube.com/watch?v=TV7qAsp6x3w",
            text:
                "To survive this planet and its atmosphere that is not at all friendly, only an extremely resistant animal can survive. The tardigrade or water bear are complex animals, able to live in environments with no oxygen and still adapt to such extremely adverse conditions.",
            resistance: "low oxygen"));

    Planet p3 = Planet(
        name: "Mars",
        id: 3,
        text:
            "The planet Mars, known as the red planet because of the iron oxide on its surface, has a relatively low gravity of 3.721 m/s^2.",
        organism: Organism(
            name: "Pseudomonas aeruginosas",
            link: "https://www.youtube.com/watch?v=WDVubcoZCP4",
            text:
                "To adapt to this lower level of gravity, bacteria such as Pseudomonas aeruginosas have developed the superpower to form biofilms, highly organized, supportive bacterial communities with the ability to adhere very strongly to the surface, fortifying their survival.",
            resistance: "low gravity"));

    flow = Start().flow();
    flow.addAll(p1.flow());
    flow.addAll(Hiperspeed().flow());
    flow.addAll(p2.flow());
    flow.addAll(p3.flow());
    flow.addAll([
      () {
        spaceContoller.hyperspeed.value = false;
        spaceContoller.hide();
        argonautContoller.back();
        spaceContoller.zoomIn();

        spaceshipController.visible.value = false;
        spaceContoller.planet.value = 4;

        spaceContoller.write(
          "Finally whe're home!",
        );
      },
      () {
        spaceContoller.write(
          "Our friends at NASA would be proud of us!",
        );
      },
    ]);
  }

  int i = 0;

  next() {
    flow[i]();
    i++;
  }
}
