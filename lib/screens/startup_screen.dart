import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen>
    with SingleTickerProviderStateMixin {
  double dragOffset = 0.0;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    animation = Tween<double>(begin: 0, end: -120).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    )..addListener(() {
      setState(() {
        dragOffset = animation.value;
      });
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _goToDashboard();
      }
    });
  }

  void _goToDashboard() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) => const DashboardScreen(),
        transitionsBuilder: (_, anim, __, child) {
          return FadeTransition(
            opacity: anim,
            child: child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onDragEnd() {
    if (dragOffset < -80) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/startup_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Foreground contents centered
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// TITLE
                Column(
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      "Your Journey",
                      style: TextStyle(
                        fontFamily: "Fraunces",
                        color: Colors.yellow[600],
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                    Text(
                      "Starts Here",
                      style: TextStyle(
                        fontFamily: "Fraunces",
                        color: Colors.yellow[600],
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "WELCOME TO LAKBAY",
                      style: TextStyle(
                        fontFamily: "Fraunces",
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: 4,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 260),

                /// SWIPE UP TRACK + MOVING BUTTON
                /// SWIPE TRACK + BUTTON (UPDATED)
                GestureDetector(
                  onVerticalDragUpdate: (details) {
                    setState(() {
                      dragOffset += details.delta.dy;
                      dragOffset = dragOffset.clamp(-120.0, 0.0);
                    });
                  },
                  onVerticalDragEnd: (_) => _onDragEnd(),
                  child: Column(
                    children: [

                      /// TRACK — FIXED SIZE + NEW GRADIENT + 2 ARROWS
                      Container(
                        width: 89,
                        height: 198,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(217, 217, 217, 0.0),   // 7.69%
                              Color.fromRGBO(255, 255, 255, 0.8),   // 44.71%
                            ],
                            stops: [0.0769, 0.4471],
                          ),
                        ),

                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            /// ARROW 1
                            const Positioned(
                              top: 35,
                              child: Icon(Icons.keyboard_arrow_up,
                                  size: 30, color: Colors.black87),
                            ),

                            /// ARROW 2
                            const Positioned(
                              top: 65,
                              child: Icon(Icons.keyboard_arrow_up,
                                  size: 30, color: Colors.black87),
                            ),

                            /// MOVING GO BUTTON (UPDATED SIZE)
                            Positioned(
                              bottom: 10 + dragOffset.abs(),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                curve: Curves.easeOut,
                                width: 75,
                                height: 76,
                                decoration: BoxDecoration(
                                  color: Colors.green[800],
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    )
                                  ],
                                ),
                                child: const Center(
                                  child: Text(
                                    "GO",
                                    style: TextStyle(
                                      fontFamily: "Fraunces",
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 45),

                      /// LOGO BOX (unchanged)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 22),
                        child: Image.asset(
                          'assets/images/lakbay_branding_white.png',
                          width: 150,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
