import 'package:flutter/material.dart';

class CreditScoreRatingBar extends StatelessWidget {
  final double score;
  final double maxScore;
  final ValueChanged<double>? onScoreChanged;

  const CreditScoreRatingBar({
    super.key,
    required this.score,
    this.maxScore = 850,
    this.onScoreChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (onScoreChanged != null) {
          final RenderBox renderBox = context.findRenderObject() as RenderBox;
          final position = renderBox.globalToLocal(details.globalPosition);
          final double width = renderBox.size.width;
          final double newScore = (position.dx / width) * maxScore;
          
          // Clamp the score between 300 and maxScore
          final clampedScore = newScore.clamp(300.0, maxScore);
          onScoreChanged!(clampedScore);
        }
      },
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFE53935),  // Deep Red
              Color(0xFFFF7043),  // Coral
              Color(0xFFFFD54F),  // Yellow
              Color(0xFF66BB6A),  // Light Green
              Color(0xFF2E7D32),  // Dark Green
            ],
          ),
        ),
        child: Stack(
          children: [
            // Score indicator
            Positioned(
              left: (score / maxScore) * MediaQuery.of(context).size.width - 40,
              top: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    score.toInt().toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 