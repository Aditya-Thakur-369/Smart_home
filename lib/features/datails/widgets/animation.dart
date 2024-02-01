import 'package:flutter/material.dart';

class BounceFromBottomAnimation extends StatefulWidget {
  const BounceFromBottomAnimation(
      {Key? key, required this.child, required this.delay});

  final Widget child;
  final double delay;

  @override
  _BounceFromBottomAnimationState createState() =>
      _BounceFromBottomAnimationState();
}

class _BounceFromBottomAnimationState extends State<BounceFromBottomAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: (500 * widget.delay).round()),
      vsync: this,
    );

    final Animation<double> curve =
        CurvedAnimation(parent: controller, curve: Curves.elasticOut);

    animation = Tween<double>(begin: 100.0, end: 0.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, animation.value),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
