import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'package:lakbay/components/custom_animation.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen>
    with SingleTickerProviderStateMixin {
  final SwipeUpAnimation swipeAnim = SwipeUpAnimation();

  @override
  void initState() {
    super.initState();

    swipeAnim.init(
      this,
      _goToDashboard,
          () => setState(() {}),
    );
  }

  void _goToDashboard() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) => const DashboardScreen(),
        transitionsBuilder: (_, anim, __, child) {
          return FadeTransition(opacity: anim, child: child);
        },
      ),
    );
  }

  @override
  void dispose() {
    swipeAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/startup_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 130),

                /// TITLE
                Column(
                  children: [
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

                const SizedBox(height: 200),

                GestureDetector(
                  onVerticalDragUpdate: (details) {
                    setState(() {
                      swipeAnim.updateDrag(details.delta.dy);
                    });
                  },
                  onVerticalDragEnd: (_) => swipeAnim.handleDragEnd(),

                  child: Column(
                    children: [
                      Container(
                        width: 89,
                        height: 198,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(217, 217, 217, 0.0),
                              Color.fromRGBO(255, 255, 255, 0.8),
                            ],
                            stops: [0.0769, 0.4471],
                          ),
                        ),

                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const Positioned(
                              top: 35,
                              child: Icon(Icons.keyboard_arrow_up,
                                  size: 30, color: Colors.black87),
                            ),

                            const Positioned(
                              top: 65,
                              child: Icon(Icons.keyboard_arrow_up,
                                  size: 30, color: Colors.black87),
                            ),

                            Positioned(
                              bottom: 10 + swipeAnim.dragOffset.abs(),
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

                      const SizedBox(height: 25),

                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 22),
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
