// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class RotateFadeAnimation extends StatefulWidget {
  const RotateFadeAnimation({Key? key, required this.child, required this.delay});

  final Widget child;
  final double delay;

  @override
  _RotateFadeAnimationState createState() => _RotateFadeAnimationState();
}

class _RotateFadeAnimationState extends State<RotateFadeAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> rotateAnimation; 

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: (800 * widget.delay).round()),
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

    rotateAnimation = Tween<double>(begin: 0, end: 2 * 3.14).animate(
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
    return Transform.rotate(
      angle: rotateAnimation.value,
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
