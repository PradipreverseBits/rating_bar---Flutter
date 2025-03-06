import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../configurations/rating_configuration.dart';

class RatingBarWidget extends StatelessWidget {
  final RatingConfiguration config;

  const RatingBarWidget({
    super.key,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          config.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 20),
        Center(
          child: config.isIndicator
              ? RatingBarIndicator(
                  rating: config.initialRating,
                  itemBuilder: config.itemBuilder,
                  itemCount: 5,
                  itemSize: config.itemSize,
                  direction: Axis.horizontal,
                )
              : RatingBar.builder(
                  initialRating: config.initialRating,
                  minRating: config.minRating,
                  direction: Axis.horizontal,
                  allowHalfRating: config.allowHalfRating,
                  itemCount: 5,
                  itemSize: config.itemSize,
                  itemBuilder: config.itemBuilder,
                  onRatingUpdate: config.onRatingUpdate ?? ((_) {}),
                ),
        ),
        if (!config.isIndicator)
          Center(
            child: Text(
              'Rating: ${config.initialRating}',
              style: const TextStyle(fontSize: 18),
            ),
          ),
        const SizedBox(height: 40),
      ],
    );
  }
} 