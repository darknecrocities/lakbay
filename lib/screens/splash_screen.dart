import 'package:flutter/material.dart';
import 'startup_screen.dart';
import 'package:lakbay/components/splashscreen/splash_animation.dart'; // you will use your own animation transition here

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeIn = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    /// When fade-in finishes → navigate with custom animation
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        CustomPageRoute(child: const StartupScreen()), // from custom_animation.dart
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF026E55), // background #026E55
      body: Center(
        child: FadeTransition(
          opacity: _fadeIn,
          child: Image.asset(
            "assets/images/lakbay_logo.png",
            width: 280,
            height: 280,
          ),
        ),
      ),
    );
  }
}
