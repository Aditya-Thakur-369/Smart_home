import 'package:flutter/material.dart';

class MasterPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.strokeWidth = 2;
    paint.color = const Color.fromARGB(255, 134, 172, 230);
    paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 72);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2 - 80), 140, paint);
    canvas.drawCircle(Offset(size.width / 2, size.height - 60), 100, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
