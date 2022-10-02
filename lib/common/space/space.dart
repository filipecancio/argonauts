import 'package:argonauts/common/argonaut/argonaut.dart';
import 'package:argonauts/common/space/star.dart';
import 'package:argonauts/common/space/star_field.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Space extends StatefulWidget {
  const Space({Key? key}) : super(key: key);

  @override
  _SpaceState createState() => _SpaceState();
}

class _SpaceState extends State<Space> with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StarField(),
          RiveAnimation.asset("assets/draw_order_demo_parallax.riv"),
          Argonaut()
        ],
      ),
    );
  }
}
