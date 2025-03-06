import 'package:flutter/material.dart';

class RatingUtils {
  static String getEmoji(int index) {
    switch (index) {
      case -1:
        return '😶';
      case 0:
        return '😡'; // 1 rating
      case 1:
        return '😕'; // 2 rating
      case 2:
        return '😊'; // 3 rating
      case 3:
        return '😃'; // 4 rating
      case 4:
        return '🤩'; // 5 rating
      default:
        return '😐';
    }
  }

  static Color getEmojiColor(int index) {
    switch (index) {
      case -1:
        return Colors.grey;
      case 0:
        return const Color(0xFF8B0000); // Dark red
      case 1:
        return Colors.pink; // Pink
      case 2:
        return Colors.yellow; // Yellow
      case 3:
        return Colors.lightGreen; // Light green
      case 4:
        return const Color(0xFF006400); // Dark green
      default:
        return Colors.grey;
    }
  }

  static Color getStarColor(int index) {
    switch (index) {
      case 0:
        return const Color(0xFF8B0000); // Dark red
      case 1:
        return Colors.pink; // Pink
      case 2:
        return Colors.yellow; // Yellow
      case 3:
        return Colors.lightGreen; // Light green
      case 4:
        return const Color(0xFF006400); // Dark green
      default:
        return Colors.grey;
    }
  }

  static String? validateRating(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a rating';
    }
    try {
      double rating = double.parse(value);
      if (rating < 0) {
        return 'Rating cannot be less than 0';
      }
      if (rating > 5) {
        return 'Rating cannot be greater than 5';
      }
    } catch (e) {
      return 'Please enter a valid number';
    }
    return null;
  }



 static String getMoodText(int score) {
    switch (score) {
      case 0:
        return 'Very Angry';
      case 1:
        return 'Unhappy';
      case 2:
        return 'Neutral';
      case 3:
        return 'Happy';
      case 4:
        return 'Very Happy';
      default:
        return 'Neutral';
    }
  }


} 