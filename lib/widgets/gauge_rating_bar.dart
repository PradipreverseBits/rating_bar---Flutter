import 'package:flutter/material.dart';
import 'dart:math' as math;

class GaugeRatingBar extends StatelessWidget {
  final int score;
  final int maxScore;
  final ValueChanged<int>? onScoreChanged;

  const GaugeRatingBar({
    super.key,
    required this.score,
    this.maxScore = 999,
    this.onScoreChanged,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: 280,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (onScoreChanged != null) {
            final RenderBox renderBox = context.findRenderObject() as RenderBox;
            final position = renderBox.globalToLocal(details.globalPosition);
            final double width = renderBox.size.width;
            final double percentage = (position.dx / width).clamp(0.0, 1.0);
            final int newScore = (percentage * maxScore).round();
            onScoreChanged!(newScore);
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Semi-circular gauge
            Positioned(
              top: 20,
              child: CustomPaint(
                size: Size(screenWidth * 0.85, screenWidth * 0.425),
                painter: GaugePainter(
                  score: score,
                  maxScore: maxScore,
                ),
              ),
            ),
            // Score display in center
            Positioned(
              top: screenWidth * 0.25,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'YOUR SCORE:',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    score.toString(),
                    style: const TextStyle(
                      color: Color(0xFF1A237E),
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'OF $maxScore',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  final int score;
  final int maxScore;

  GaugePainter({required this.score, required this.maxScore});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);
    
    // Create linear gradient
    final gradient = const LinearGradient(
      colors: [
        Color(0xFFE53935),  // Deep Red
        Color(0xFFFF7043),  // Coral
        Color(0xFFFFD54F),  // Yellow
        Color(0xFF66BB6A),  // Light Green
        Color(0xFF2E7D32),  // Dark Green
      ],
    ).createShader(rect);

    final paint = Paint()
      ..shader = gradient
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    // Draw the semi-circle
    canvas.drawArc(
      rect,
      math.pi,  // Start from 180 degrees
      math.pi,  // Sweep 180 degrees
      false,
      paint,
    );

    // Draw indicator
    final progress = score / maxScore;
    final angle = math.pi + (math.pi * progress);
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;
    
    final indicatorPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final indicatorPosition = Offset(
      center.dx + radius * math.cos(angle),
      center.dy + radius * math.sin(angle),
    );

    canvas.drawCircle(indicatorPosition, 6, indicatorPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
} 