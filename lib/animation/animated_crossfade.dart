import 'package:flutter/material.dart';

class AnimatedCrossfadeScreen extends StatefulWidget {
  const AnimatedCrossfadeScreen({super.key});

  @override
  State<AnimatedCrossfadeScreen> createState() =>
      _AnimatedCrossfadeScreenState();
}

class _AnimatedCrossfadeScreenState extends State<AnimatedCrossfadeScreen> {
  double width = 100;
  double height = 100;
  bool first = true;
  String text = "show more";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Crossfade")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              duration: const Duration(seconds: 1),
              firstChild: Container(
                width: width,
                height: height,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    "Flutter",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              secondChild: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "flutter frame work contain the dart language and flutter engine",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              crossFadeState: first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  first = !first;
                  text = first ? "show more" : "show less";
                });
              },
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}
