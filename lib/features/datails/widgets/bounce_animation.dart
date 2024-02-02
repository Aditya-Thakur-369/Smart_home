import 'package:flutter/material.dart';

class ScaleFadeBounceAnimation extends StatefulWidget {
  const ScaleFadeBounceAnimation({Key? key, required this.child, required this.delay});

  final Widget child;
  final double delay;

  @override
  _ScaleFadeBounceAnimationState createState() => _ScaleFadeBounceAnimationState();
}

class _ScaleFadeBounceAnimationState extends State<ScaleFadeBounceAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation; 
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: (800 * widget.delay).round()),
      vsync: this,
    );
    
    scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: scaleAnimation.value,
          child: Opacity(
            opacity: fadeAnimation.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
