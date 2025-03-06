import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/rating_bar_widget.dart';
import '../configurations/rating_configuration.dart';
import '../utils/rating_utils.dart';

@RoutePage()
class EmojiRatingScreen extends StatefulWidget {
  const EmojiRatingScreen({super.key});

  @override
  State<EmojiRatingScreen> createState() => _EmojiRatingScreenState();
}

class _EmojiRatingScreenState extends State<EmojiRatingScreen> {
  double _emojiRating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emoji Rating'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Interactive Emoji Rating',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            RatingBarWidget(
              config: RatingConfiguration(
                title: '',
                initialRating: _emojiRating,
                allowHalfRating: false,
                minRating: 0,
                itemSize: 60,
                itemBuilder: (context, index) => Text(
                  _emojiRating == 0 ? RatingUtils.getEmoji(-1) : RatingUtils.getEmoji(index),
                  style: TextStyle(
                    fontSize: 40,
                    color: _emojiRating == 0 ? RatingUtils.getEmojiColor(-1) : RatingUtils.getEmojiColor(index),
                  ),
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _emojiRating = rating;
                  });
                },
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Current Rating: ${_emojiRating.toInt()}',
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