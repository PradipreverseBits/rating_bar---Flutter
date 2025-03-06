import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/rating_bar_widget.dart';
import '../configurations/rating_configuration.dart';

@RoutePage()
class DefaultRatingScreen extends StatefulWidget {
  const DefaultRatingScreen({super.key});

  @override
  State<DefaultRatingScreen> createState() => _DefaultRatingScreenState();
}

class _DefaultRatingScreenState extends State<DefaultRatingScreen> {
  double _rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Default Rating'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Default Star Rating',
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
                minRating: 1,
                itemSize: 50,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
            ),
            const SizedBox(height: 40),
            RatingBarWidget(
              config: RatingConfiguration(
                title: 'Indicator Only (Non-interactive)',
                initialRating: 3.75,
                isIndicator: true,
                itemSize: 50,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (_) {},
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