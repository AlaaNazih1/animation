
import 'package:animation/animation/ainmated_container.dart';
import 'package:animation/animation/animated_crossfade.dart';
import 'package:animation/animation/animated_opacity.dart';
import 'package:animation/animation/explicit_animation.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExplicitAnimationScreen(),
    );
  }
}
