// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ScaleFadeAnimation extends StatefulWidget {
  const ScaleFadeAnimation({Key? key, required this.child, required this.delay});

  final Widget child;
  final double delay;

  @override
  // ignore: library_private_types_in_public_api
  _ScaleFadeAnimationState createState() => _ScaleFadeAnimationState();
} 

class _ScaleFadeAnimationState extends State<ScaleFadeAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: (500 * widget.delay).round()),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scaleAnimation.value,
      child: Opacity(
        opacity: animation.value,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
