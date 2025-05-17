import 'package:flutter/material.dart';

class DiamondPainter extends CustomPainter {
  final Color color;
  final double glucoseValue;

  DiamondPainter({required this.color, required this.glucoseValue});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;

    // Draw the diamond shape
    final Path path =
        Path()
          ..moveTo(size.width / 2, 0)
          ..lineTo(size.width, size.height / 2)
          ..lineTo(size.width / 2, size.height)
          ..lineTo(0, size.height / 2)
          ..close();

    canvas.drawPath(path, paint);

    if (glucoseValue != 0.0) {
      final TextSpan textSpan = TextSpan(
        text: getGlucoseStatus('mg/dL', glucoseValue),
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );

      final TextPainter textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      );

      textPainter.layout();

      final offset = Offset(
        (size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2,
      );

      textPainter.paint(canvas, offset);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

String getGlucoseStatus(String unit, double glucoseValue) {
  if (unit == 'mg/dL') {
    return glucoseValue > 600
        ? 'HI'
        : glucoseValue < 10
        ? 'LO'
        : glucoseValue.toStringAsFixed(0);
  } else {
    return glucoseValue > 33.3
        ? 'HI'
        : glucoseValue < 0.6
        ? 'LO'
        : glucoseValue.toStringAsFixed(1);
  }
}
