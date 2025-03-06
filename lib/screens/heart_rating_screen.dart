import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/rating_bar_widget.dart';
import '../configurations/rating_configuration.dart';

@RoutePage()
class HeartRatingScreen extends StatefulWidget {
  const HeartRatingScreen({super.key});

  @override
  State<HeartRatingScreen> createState() => _HeartRatingScreenState();
}

class _HeartRatingScreenState extends State<HeartRatingScreen> {
  double _rating = 2.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heart Rating'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Interactive Heart Rating',
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
                itemBuilder: (context, _) => const Icon(
                  Icons.favorite,
                  color: Colors.red,
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