import 'package:flutter/material.dart';

class CreditScoreRatingBar extends StatelessWidget {
  final double score;
  final double maxScore;
  final ValueChanged<double>? onScoreChanged;
  final double minScore = 300.0;

  const CreditScoreRatingBar({
    super.key,
    required this.score,
    this.maxScore = 850,
    this.onScoreChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final barWidth = constraints.maxWidth;
        final indicatorWidth = 80.0; // Width of the score indicator
        final availableWidth = barWidth - indicatorWidth;
        
        // Calculate normalized position (0 to 1)
        final normalizedPosition = (score - minScore) / (maxScore - minScore);
        // Calculate actual position in pixels
        final indicatorPosition = normalizedPosition * availableWidth;

        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            if (onScoreChanged != null) {
              final RenderBox renderBox = context.findRenderObject() as RenderBox;
              final position = renderBox.globalToLocal(details.globalPosition);
              
              // Calculate score based on position
              final normalizedX = (position.dx / availableWidth).clamp(0.0, 1.0);
              final newScore = minScore + (normalizedX * (maxScore - minScore));
              
              // Clamp the score between minScore and maxScore
              final clampedScore = newScore.clamp(minScore, maxScore);
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
                  left: indicatorPosition,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: indicatorWidth,
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
      },
    );
  }
} 