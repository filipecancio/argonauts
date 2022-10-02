import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Spaceship extends StatefulWidget {
  const Spaceship({Key? key}) : super(key: key);

  @override
  _SpaceshipState createState() => _SpaceshipState();
}

class _SpaceshipState extends State<Spaceship> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: Center(
          child: RiveAnimation.network(
            'https://cdn.rive.app/animations/vehicles.riv',
            fit: BoxFit.cover,
          ),
        ));
  }
}
