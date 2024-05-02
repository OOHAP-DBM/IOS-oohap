import '../../../core/app_export.dart';
/*

class NewTextPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFF882FFA)
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(42, 0)
      ..lineTo(37.4062, 7)
      ..lineTo(42, 14)
      ..lineTo(0, 14)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}*/
/*

import 'dart:ui' as ui;

class GridBorderCustomPainter extends CustomPainter {
  final Color borderColor;

  GridBorderCustomPainter(this.borderColor);
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9806187, size.height * 0.8888192);
    path_0.lineTo(size.width * 0.7564430, size.height * 0.8888192);
    path_0.lineTo(size.width * 0.7041456, size.height * 0.9794458);
    path_0.lineTo(size.width * 0.2985474, size.height * 0.9794458);
    path_0.lineTo(size.width * 0.2465430, size.height * 0.8888192);
    path_0.lineTo(size.width * 0.01938131, size.height * 0.8888192);
    path_0.lineTo(size.width * 0.01938131, size.height * 0.02055421);
    path_0.lineTo(size.width * 0.9806187, size.height * 0.02055421);
    path_0.lineTo(size.width * 0.9806187, size.height * 0.8888192);
    path_0.close();

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.002790685;
    paint_0_stroke.color = borderColor;
    canvas.drawPath(path_0, paint_0_stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
*/


import 'package:flutter/material.dart';

class GridBorderCustomPainter extends CustomPainter {
  final Color borderColor;
  final Color backgroundColor;

  GridBorderCustomPainter(this.borderColor, this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    // Draw border path
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9806187, size.height * 0.8888192);
    path_0.lineTo(size.width * 0.7564430, size.height * 0.8888192);
    path_0.lineTo(size.width * 0.7041456, size.height * 0.9794458);
    path_0.lineTo(size.width * 0.2985474, size.height * 0.9794458);
    path_0.lineTo(size.width * 0.2465430, size.height * 0.8888192);
    path_0.lineTo(size.width * 0.01938131, size.height * 0.8888192);
    path_0.lineTo(size.width * 0.01938131, size.height * 0.02055421);
    path_0.lineTo(size.width * 0.9806187, size.height * 0.02055421);
    path_0.lineTo(size.width * 0.9806187, size.height * 0.8888192);
    path_0.close();

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.002790685;
    paint_0_stroke.color = borderColor;
    canvas.drawPath(path_0, paint_0_stroke);

    // Draw filled path for background
    Paint paint_0_fill = Paint()
      ..style = PaintingStyle.fill
      ..color = backgroundColor;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}