import 'package:flutter/material.dart';

class ExplicitAnimationScreen extends StatefulWidget {
  const ExplicitAnimationScreen({super.key});

  @override
  State<ExplicitAnimationScreen> createState() =>
      _ExplicitAnimationScreenState();
}

class _ExplicitAnimationScreenState extends State<ExplicitAnimationScreen>
    with SingleTickerProviderStateMixin {
  double width = 60;
  bool showInfo = false;
  late final AnimationController _controller;
  bool isReversed = false;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/photo_2026-02-28_14-44-51.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
              ),
              child: const Icon(Icons.wb_sunny, color: Colors.yellow, size: 50),
            ),
          ),

          Center(
            child: RotationTransition(
              turns: isReversed
                  ? _controller
                  : Tween<double>(begin: 1, end: 0).animate(_controller),
              child: Builder(
                builder: (context) {
                  double baseRadius = 120; 
                  double dynamicRadius = baseRadius + (width / 2);
                  return SizedBox(
                    width: dynamicRadius * 2,
                    height: dynamicRadius * 2,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                  
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                  
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            width: width,
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/photo_2026-02-28_14-44-24-removebg-preview.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 120,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              opacity: showInfo ? 1 : 0,
              child: Container(
                padding: const EdgeInsets.all(12),
               
                child: const Text(
                  'Planet A - Blue World\nPlanet B - Green World',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
          
        ],

      ),
      

      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                isReversed = !isReversed;
              });
            },
            child: const Icon(Icons.autorenew),
          ),
          const SizedBox(width: 15),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _controller.isAnimating
                    ? _controller.stop()
                    : _controller.repeat();
              });
            },
            child: const Icon(Icons.play_arrow),
          ),
          const SizedBox(width: 15),
          FloatingActionButton(
            onPressed: () {
          
            
                setState(() {
                  showInfo = !showInfo;
                });
             
            },
            child: const Icon(Icons.info),
          ),
          const SizedBox(width: 15),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                width = width == 60 ? 200 : 60;
              });
            },
            child: const Icon(Icons.zoom_in),
          ),
        ],
      ),
    );
  }
}
