import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/rating_bar_widget.dart';
import '../configurations/rating_configuration.dart';
import '../utils/rating_utils.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Interactive Star Rating',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
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
            const SizedBox(height: 40),
            Text(
              'Current Rating: ${_rating.toStringAsFixed(1)}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Tap or drag to change the rating',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 