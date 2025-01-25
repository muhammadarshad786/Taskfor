
import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final double circleHeight;

  CirclePainter({required this.circleHeight});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red 
      ..style = PaintingStyle.fill; 
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, circleHeight / 2, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.circleHeight != circleHeight;
  }
}