import 'package:argonauts/common/space/star.dart';
import 'package:flutter/material.dart';

class StarField extends StatefulWidget {
  const StarField({Key? key}) : super(key: key);

  @override
  _StarFieldState createState() => _StarFieldState();
}

class _StarFieldState extends State<StarField> with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController animationController2;
  late AnimationController animationController3;
  late AnimationController animationController4;
  final starList = <Star>[];
  final numStars = 40;

  @override
  Widget build(BuildContext context) {
    starList.clear();
    List.generate(numStars, (i) {
      starList.add(Star(id: i, screenSize: MediaQuery.of(context).size));
    });

    animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 4),
        animationBehavior: AnimationBehavior.normal)
      ..addListener(() {
        for (int i = 0; i < 10; i++) {
          starList[i].glow(animationController.value);
        }
      })
      ..repeat();

    animationController2 = AnimationController(
        vsync: this,
        duration: Duration(seconds: 5),
        animationBehavior: AnimationBehavior.normal)
      ..addListener(() {
        for (int i = 10; i < 20; i++) {
          starList[i].glow(animationController2.value);
        }
      })
      ..repeat();

    animationController3 = AnimationController(
        vsync: this,
        duration: Duration(seconds: 10),
        animationBehavior: AnimationBehavior.normal)
      ..addListener(() {
        for (int i = 20; i < 30; i++) {
          starList[i].glow(animationController3.value);
        }
      })
      ..repeat();

    animationController4 = AnimationController(
        vsync: this,
        duration: Duration(seconds: 8),
        animationBehavior: AnimationBehavior.normal)
      ..addListener(() {
        for (int i = 30; i < 40; i++) {
          starList[i].glow(animationController4.value);
        }
      })
      ..repeat();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
              colors: [
                Color(0xFF211F4C),
                Color(0xFF13121F),
              ],
              center: Alignment.center,
              stops: [0.5, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: AnimatedBuilder(
          animation: CurvedAnimation(
              parent: animationController, curve: Curves.easeInOut),
          builder: (context, child) => CustomPaint(
            size: MediaQuery.of(context).size,
            painter: _DemoPainter(MediaQuery.of(context).size, starList),
          ),
        ),
      ),
    );
  }
}

class _DemoPainter extends CustomPainter {
  final List<Star> starList;
  final Size screenSize;

  _DemoPainter(this.screenSize, this.starList);

  @override
  void paint(Canvas canvas, Size size) {
    for (var node in starList) {
      node.display(canvas);
    }
  }

  @override
  bool shouldRepaint(_DemoPainter oldDelegate) => true;
}
