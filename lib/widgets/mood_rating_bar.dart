import 'package:flutter/material.dart';
import 'dart:math' as math;

class MoodRatingBar extends StatelessWidget {
  final int score;
  final int maxScore;
  final ValueChanged<int>? onScoreChanged;

  const MoodRatingBar({
    super.key,
    required this.score,
    this.maxScore = 4,  // Changed to 4 since we have 5 segments (0-4)
    this.onScoreChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 200,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onPanDown: (details) => _handleTouch(context, details.localPosition),
            onPanUpdate: (details) => _handleTouch(context, details.localPosition),
            child: CustomPaint(
              size: Size(constraints.maxWidth, constraints.maxHeight),
              painter: MoodGaugePainter(
                score: score,
                maxScore: maxScore,
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleTouch(BuildContext context, Offset position) {
    if (onScoreChanged == null) return;

    final RenderBox box = context.findRenderObject() as RenderBox;
    final size = box.size;
    final center = Offset(size.width / 2, size.height * 0.9);
    
    // Calculate angle from touch position relative to center
    final touchVector = position - center;
    var angle = math.atan2(touchVector.dy, touchVector.dx);
    
    // Restrict angle to upper half circle (pi to 2pi)
    if (angle < 0) {
      angle = math.pi * 2 + angle;
    }
    
    // Only process if angle is in the valid range (pi to 2pi)
    if (angle >= math.pi && angle <= math.pi * 2) {
      // Map angle from (pi to 2pi) to (0 to 1)
      var normalizedAngle = (angle - math.pi) / math.pi;
      
      // Convert to score (0-4)
      int newScore = (normalizedAngle * maxScore).round();
      newScore = newScore.clamp(0, maxScore);
      
      onScoreChanged!(newScore);
    }
  }
}

class MoodGaugePainter extends CustomPainter {
  final int score;
  final int maxScore;

  MoodGaugePainter({
    required this.score,
    required this.maxScore,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.9);
    final radius = size.width * 0.45;
    
    // Define colors for each segment
    final colors = [
      const Color(0xFFE53935), // Red
      const Color(0xFFFF9800), // Orange
      const Color(0xFFFFEB3B), // Yellow
      const Color(0xFF8BC34A), // Light Green
      const Color(0xFF4CAF50), // Green
    ];

    // Draw background arc
    final bgPaint = Paint()
      ..color = Colors.grey[200]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi,
      false,
      bgPaint,
    );

    // Draw colored segments
    final segmentAngle = math.pi / colors.length;
    for (var i = 0; i < colors.length; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = 35
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        math.pi + (i * segmentAngle),
        segmentAngle,
        false,
        paint,
      );
    }

    // Draw emoji faces with white background circles
    final emojis = ['😠', '😟', '😐', '🙂', '😊'];
    final textStyle = TextStyle(
      fontSize: 24,
      color: Colors.black87,
    );

    for (var i = 0; i < emojis.length; i++) {
      final angle = math.pi + (i * segmentAngle) + (segmentAngle / 2);
      final emojiCenter = Offset(
        center.dx + (radius * math.cos(angle)),
        center.dy + (radius * math.sin(angle)),
      );

      // Draw white circle background
      canvas.drawCircle(
        emojiCenter,
        18,
        Paint()..color = Colors.white,
      );

      // Draw emoji
      final textSpan = TextSpan(
        text: emojis[i],
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        emojiCenter.translate(-textPainter.width / 2, -textPainter.height / 2),
      );
    }

    // Calculate needle angle based on score
    final progress = score / maxScore;
    final needleAngle = math.pi + (math.pi * progress);
    
    // Draw needle with shadow
    final needleLength = radius - 20;
    final shadowPaint = Paint()
      ..color = Colors.black26
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    // Draw shadow
    canvas.drawLine(
      center.translate(2, 2),
      Offset(
        center.dx + needleLength * math.cos(needleAngle),
        center.dy + needleLength * math.sin(needleAngle),
      ).translate(2, 2),
      shadowPaint,
    );

    // Draw needle
    final needlePaint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      center,
      Offset(
        center.dx + needleLength * math.cos(needleAngle),
        center.dy + needleLength * math.sin(needleAngle),
      ),
      needlePaint,
    );

    // Draw center circle with shadow
    canvas.drawCircle(
      center.translate(2, 2),
      15,
      Paint()..color = Colors.black26,
    );
    canvas.drawCircle(
      center,
      15,
      Paint()..color = Colors.grey[300]!,
    );
    canvas.drawCircle(
      center,
      12,
      Paint()..color = Colors.black87,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
} 