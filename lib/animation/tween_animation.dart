import 'dart:math';

import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
    double opacity = 1;
  double begin = 0;
  double end = 2 * pi;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: begin, end: end),
          duration: const Duration(seconds: 2),
          child: Icon(Icons.favorite, size: 100, color: Colors.red),

          builder: (context, value, child) {
            opacity = value/(2 * pi);
            return Opacity(
                opacity: opacity, child: Transform.rotate(angle: value, child: child));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
           end = 0;
            begin = 2 * pi;
            
        });
       
        
      }, child: const Icon(Icons.play_arrow)),
    );
  }
}
