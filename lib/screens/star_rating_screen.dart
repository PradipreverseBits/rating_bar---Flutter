import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/rating_bar_widget.dart';
import '../configurations/rating_configuration.dart';
import '../utils/rating_utils.dart';
import '../theme.dart';

@RoutePage()
class StarRatingScreen extends StatefulWidget {
  const StarRatingScreen({super.key});

  @override
  State<StarRatingScreen> createState() => _StarRatingScreenState();
}

class _StarRatingScreenState extends State<StarRatingScreen> {
  double _rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star Rating'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppStyle.sp24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Interactive Star Rating',
                style: AppStyle.heading,
              ),
              const SizedBox(height: AppStyle.sp32),
              RatingBarWidget(
                config: RatingConfiguration(
                  title: '',
                  initialRating: _rating,
                  minRating: 0,
                  itemSize: 50,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: RatingUtils.getStarColor(index),
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
              ),
              const SizedBox(height: AppStyle.sp32),
              Text(
                'Current Rating: ${_rating.toStringAsFixed(1)}',
                style: AppStyle.subheading.copyWith(
                  color: AppStyle.textGrey,
                ),
              ),
              const SizedBox(height: AppStyle.sp16),
              Text(
                'Tap or drag to change the rating',
                style: AppStyle.body.copyWith(
                  color: AppStyle.textGreyLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 