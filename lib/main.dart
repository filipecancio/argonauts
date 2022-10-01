import 'package:argonauts/ui/page/info.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Argonauts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InfoPage(title: 'Argonauts'),
    );
  }
}