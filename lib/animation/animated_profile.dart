import 'package:flutter/material.dart';

class AnimatedProfileCard extends StatefulWidget {
  const AnimatedProfileCard({super.key});

  @override
  State<AnimatedProfileCard> createState() => _AnimatedProfileCardState();
}

class _AnimatedProfileCardState extends State<AnimatedProfileCard> {
  bool isBig = false;
  bool isBlue = false;
  bool showAvatar = true;
  bool showDetails = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Profile Card",style: 
      TextStyle(color: Colors.white),),
      centerTitle: true,backgroundColor: Colors.teal,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              height: isBig ? 350 : 280,
              width: isBig ? 350 : 280,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isBlue ? Colors.teal : Colors.grey,
                borderRadius: BorderRadius.circular(20),
                
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
               
                  AnimatedCrossFade(
                    duration: const Duration(microseconds: 200),
                    crossFadeState: showAvatar
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        "https://i.pravatar.cc/150?img=3",
                      ),
                    ),
                    secondChild: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star,color: Colors.yellow,size: 20,),
                           const SizedBox(width: 5),
                          Text(
                            "Vip",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Alaa Nazih",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                 
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: showDetails ? 100 : 0,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: showDetails ? 1 : 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(height: 10),
                          Text(
                            "Flutter Developer . UI/UX Designer",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.favorite, color: Colors.red, size: 16),
                              SizedBox(width: 10),
                              
                              Icon(Icons.share, color: Colors.white, size: 16),
                           SizedBox(width: 10),
                           Icon(Icons.message, color: Colors.white, size: 16),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

           
            Column(
              mainAxisAlignment:  MainAxisAlignment.center,
             
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => setState(
                        () {
                           isBig = !isBig
                           ;
                           isBig ? isBlue = true : isBlue = false;
                          
                           }
                        ),
                      child: const Text("Resize & Color"),
                    ),
                      const SizedBox(width: 10),
                      
                    ElevatedButton(
                      onPressed: () => setState(() => showAvatar = !showAvatar),
                      child: const Text("Toggle Avatar"),
                    ),
                  ],
                ),
              SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => setState(() => showDetails = !showDetails),
                  child: const Text("Show/Hide Details"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
