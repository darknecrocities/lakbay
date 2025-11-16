// custom_animation.dart
import 'package:flutter/material.dart';

class SwipeUpAnimation {
  late AnimationController controller;
  late Animation<double> animation;
  double dragOffset = 0.0;

  /// Initialize animation system
  void init(TickerProvider vsync, VoidCallback onComplete, VoidCallback onUpdate) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 400),
    );

    animation = Tween<double>(begin: 0, end: -120).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    )..addListener(() => onUpdate());

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        onComplete();
      }
    });
  }

  /// Handle release
  void handleDragEnd() {
    if (dragOffset < -80) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  /// Update drag
  void updateDrag(double dy) {
    dragOffset += dy;
    dragOffset = dragOffset.clamp(-120.0, 0.0);
  }

  void dispose() {
    controller.dispose();
  }
}
