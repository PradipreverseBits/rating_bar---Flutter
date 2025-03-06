import 'package:flutter/material.dart';
import '../configurations/rating_configuration.dart';
import '../widgets/rating_bar_widget.dart';
import '../widgets/rating_text_field.dart';
import '../utils/rating_utils.dart';

class RatingBarDemo extends StatefulWidget {
  const RatingBarDemo({super.key});

  @override
  State<RatingBarDemo> createState() => _RatingBarDemoState();
}

class _RatingBarDemoState extends State<RatingBarDemo> {
  double _rating = 3.0;
  double _initialRating = 2.0;
  double _emojiRating = 0.0;
  double _textFieldRating = 0.0;
  final TextEditingController _textController = TextEditingController(text: "0.0");
  String? _errorText;

  void updateTextField(double rating) {
    setState(() {
      _textFieldRating = rating;
      _textController.text = rating.toStringAsFixed(1);
      _errorText = null;
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Rating Bar Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RatingBarWidget(
                config: RatingConfiguration(
                  title: 'Basic Rating Bar',
                  initialRating: _rating,
                  minRating: 1,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                      updateTextField(rating);
                    });
                  },
                ),
              ),
              RatingBarWidget(
                config: RatingConfiguration(
                  title: 'Custom Rating Bar',
                  initialRating: _initialRating,
                  itemBuilder: (context, _) => const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _initialRating = rating;
                      updateTextField(rating);
                    });
                  },
                ),
              ),
              RatingBarWidget(
                config: RatingConfiguration(
                  title: 'Indicator Rating Bar',
                  initialRating: 3.75,
                  isIndicator: true,
                  itemSize: 50.0,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
              ),
              RatingBarWidget(
                config: RatingConfiguration(
                  title: 'Color Changing Emoji Rating Bar',
                  initialRating: _emojiRating,
                  allowHalfRating: false,
                  minRating: 0,
                  itemBuilder: (context, index) => Text(
                    _emojiRating == 0 ? RatingUtils.getEmoji(-1) : RatingUtils.getEmoji(index),
                    style: TextStyle(
                      fontSize: 30,
                      color: _emojiRating == 0 ? RatingUtils.getEmojiColor(-1) : RatingUtils.getEmojiColor(index),
                    ),
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _emojiRating = rating;
                      updateTextField(rating);
                    });
                  },
                ),
              ),
              const Text(
                'Interactive Rating Input',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 20),
              RatingTextField(
                controller: _textController,
                errorText: _errorText,
                onChanged: (value) {
                  setState(() {
                    _errorText = RatingUtils.validateRating(value);
                    if (_errorText == null && value.isNotEmpty) {
                      try {
                        double rating = double.parse(value);
                        if (rating >= 0 && rating <= 5) {
                          _textFieldRating = rating;
                        }
                      } catch (e) {
                        // Already handled in validation
                      }
                    }
                  });
                },
              ),
              const SizedBox(height: 20),
              RatingBarWidget(
                config: RatingConfiguration(
                  title: '',
                  initialRating: _textFieldRating,
                  minRating: 0,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: RatingUtils.getStarColor(index),
                  ),
                  onRatingUpdate: updateTextField,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 