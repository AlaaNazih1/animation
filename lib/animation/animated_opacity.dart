import 'package:flutter/material.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  const AnimatedOpacityScreen({super.key});

  @override
  State<AnimatedOpacityScreen> createState() => _AnimatedOpacityScreenState();
}

class _AnimatedOpacityScreenState extends State<AnimatedOpacityScreen> {
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Opacity")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              curve: Curves.linear,
              opacity: opacity,
              child: Column(
                children: [
                  Icon(
                    Icons.flutter_dash,
                    color: Colors.blue,
                    size: 100,
                  ),
                  const SizedBox(height: 20),
               Text("Hello Flutter!",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      opacity = 1;
                    });
                  }, child: Text('reset Opacity'))
                  ,
                  const SizedBox(height: 20),
                  Text( "Opacity: ${opacity.toStringAsFixed(2)}",style: TextStyle(fontSize: 18),),
                  Slider(value: opacity, onChanged: (value) {
                    setState(() {
                      opacity = value;
                    });
                  },
                  max: 1.0
                  ,
                  min: 0.0,
                  )
                ],
              )
            ),
           
          ],
        ),
      ),
    );
  }
}
