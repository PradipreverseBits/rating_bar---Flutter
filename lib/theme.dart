import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class AppStyle {
  // Colors
  static const Color primary = Color(0xFF9C27B0); // Purple primary color
  static final Color background = Colors.purple[50]!; // Light purple background
  static const Color textDark = Color(0xFF212121);
  static const Color textLight = Colors.white;
  static final Color textGrey = Colors.grey[800]!;
  static final Color textGreyLight = Colors.grey[600]!;

  // Rating Colors
  static const List<Color> ratingGradient = [
    Color(0xFFE53935),  // Deep Red
    Color(0xFFFF7043),  // Coral
    Color(0xFFFFD54F),  // Yellow
    Color(0xFF66BB6A),  // Light Green
    Color(0xFF2E7D32),  // Dark Green
  ];

  // Spacing
  static const double sp4 = 4.0;
  static const double sp8 = 8.0;
  static const double sp16 = 16.0;
  static const double sp24 = 24.0;
  static const double sp32 = 32.0;

  // Text Styles
  static const TextStyle title = TextStyle(
    color: textLight,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static const TextStyle heading = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textDark,
    letterSpacing: 0.5,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    letterSpacing: 0.2,
  );

} 