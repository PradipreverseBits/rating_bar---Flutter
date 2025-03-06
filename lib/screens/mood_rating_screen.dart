import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../utils/rating_utils.dart';
import '../widgets/mood_rating_bar.dart';
import '../theme.dart';

@RoutePage()
class MoodRatingScreen extends StatefulWidget {
  const MoodRatingScreen({super.key});

  @override
  State<MoodRatingScreen> createState() => _MoodRatingScreenState();
}

class _MoodRatingScreenState extends State<MoodRatingScreen> {
  int _moodScore = 2; // Middle score initially

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.background,
      appBar: AppBar(
        title: const Text('Mood Rating'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppStyle.sp24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppStyle.sp32 * 2),
              Text(
                'How are you feeling today?',
                style: AppStyle.heading.copyWith(
                  color: AppStyle.textDark,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: AppStyle.sp32 * 2),
              Center(
                child: MoodRatingBar(
                  score: _moodScore,
                  onScoreChanged: (newScore) {
                    setState(() {
                      _moodScore = newScore;
                    });
                  },
                ),
              ),
              const SizedBox(height: AppStyle.sp32 * 2),
              Center(
                child: Text(
                  'Current Mood: ${RatingUtils.getMoodText(_moodScore)}',
                  style: AppStyle.subheading.copyWith(
                    color: AppStyle.textDark,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: AppStyle.sp16),
              Center(
                child: Text(
                  'Drag the needle to change your mood',
                  style: AppStyle.body.copyWith(
                    color: AppStyle.textGreyLight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}