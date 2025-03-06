import 'package:flutter/material.dart';

class RatingConfiguration {
  final String title;
  final double initialRating;
  final bool allowHalfRating;
  final bool isIndicator;
  final double itemSize;
  final Widget Function(BuildContext, int) itemBuilder;
  final Function(double)? onRatingUpdate;
  final double minRating;

  const RatingConfiguration({
    required this.title,
    required this.initialRating,
    this.allowHalfRating = true,
    this.isIndicator = false,
    this.itemSize = 40.0,
    required this.itemBuilder,
    this.onRatingUpdate,
    this.minRating = 0,
  });
} 