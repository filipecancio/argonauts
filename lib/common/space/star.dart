import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

enum Direction {
  LEFT,
  RIGHT,
  TOP,
  BOTTOM,
  TOP_LEFT,
  TOP_RIGHT,
  BOTTOM_LEFT,
  BOTTOM_RIGHT
}

class Star {
  late int id;
  late Size screenSize;
  late double size;
  late double originalSize;
  late Offset position;
  late Random random;
  late Paint notePaint, linePaint;

  Star({required this.id, this.size = 5, required this.screenSize}) {
    random = Random();
    this.originalSize = 5 + Random().nextDouble() * 5;
    position = Offset(random.nextDouble() * screenSize.width,
        random.nextDouble() * screenSize.height);

    notePaint = Paint()
      ..color = Colors.white.withAlpha(200)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;
    linePaint = Paint()
      ..color = Colors.white.withAlpha(200)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;
  }

  void display(Canvas canvas) {
    canvas.drawCircle(position, size, notePaint);
  }

  bool operator ==(o) => o is Star && o.id == id;

  int get hashCode => id;

  void glow(double value) {
    if (value > 0.5) {
      value = 1 - value;
    }
    size = originalSize * value;
  }
}
