import 'package:flutter/material.dart';

class AinmatedContainerScreen extends StatefulWidget {
  const AinmatedContainerScreen({super.key});

  @override
  State<AinmatedContainerScreen> createState() =>
      _AinmatedContainerScreenState();
}

class _AinmatedContainerScreenState extends State<AinmatedContainerScreen> {
  double width = 100;
  double height = 100;
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Container")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              height: height,
              width: width,
              color: color,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  width = width >= 320 ? 100 : width + 50;

                  if (width >= 200) {
                    color = Colors.yellow;
                    height = 200;
                  } else {
                    color = Colors.red;
                    height = 100;
                  }
                });
              },
              child: const Text("Animate"),
            ),
          ],
        ),
      ),
    );
  }
}
