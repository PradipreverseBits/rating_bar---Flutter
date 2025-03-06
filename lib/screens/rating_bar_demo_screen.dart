import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../routes/app_router.dart';
import '../theme.dart';
import '../widgets/custom_button.dart';

@RoutePage()
class RatingBarDemoScreen extends StatefulWidget {
  const RatingBarDemoScreen({super.key});

  @override
  State<RatingBarDemoScreen> createState() => _RatingBarDemoScreenState();
}

class _RatingBarDemoScreenState extends State<RatingBarDemoScreen> {
  final TextEditingController _textController =
      TextEditingController(text: "0.0");
  final TextEditingController _creditScoreController =
      TextEditingController(text: "750");

  void updateTextField(double rating) {
    setState(() {
      _textController.text = rating.toStringAsFixed(1);
    });
  }

  void updateCreditScore(String value) {
    if (value.isEmpty) {
      setState(() {
      });
      return;
    }

    try {
      double score = double.parse(value);
      if (score < 300 || score > 850) {
        setState(() {
        });
      } else {
        setState(() {
        });
      }
    } catch (e) {
      setState(() {
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _creditScoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.background,
      appBar: AppBar(
        title: Text(
          'Rating Bar Demo',
          style: AppStyle.title.copyWith(
            color: AppStyle.textDark,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppStyle.background,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppStyle.sp24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Select Rating Type',
                  style: AppStyle.heading.copyWith(
                    fontSize: 32,
                    color: AppStyle.textDark,
                  ),
                ),
                const SizedBox(height: AppStyle.sp32),
                _buildRatingButton(
                  'Default Rating',
                  Icons.star_border,
                  () => context.router.push(const DefaultRatingRoute()),
                ),
                const SizedBox(height: AppStyle.sp16),
                _buildRatingButton(
                  'Gauge Rating',
                  Icons.speed,
                  () => context.router.push(const GaugeRatingRoute()),
                ),
                const SizedBox(height: AppStyle.sp16),
                _buildRatingButton(
                  'Credit Score Rating',
                  Icons.credit_score,
                  () => context.router.push(const CreditScoreRoute()),
                ),
                const SizedBox(height: AppStyle.sp16),
                _buildRatingButton(
                  'Star Rating',
                  Icons.star,
                  () => context.router.push(const StarRatingRoute()),
                ),
                const SizedBox(height: AppStyle.sp16),
                _buildRatingButton(
                  'Heart Rating',
                  Icons.favorite,
                  () => context.router.push(const HeartRatingRoute()),
                ),
                const SizedBox(height: AppStyle.sp16),
                _buildRatingButton(
                  'Emoji Rating',
                  Icons.emoji_emotions,
                  () => context.router.push(const EmojiRatingRoute()),
                ),
                const SizedBox(height: AppStyle.sp16),
                _buildRatingButton(
                  'Mood Rating',
                  Icons.mood,
                  () => context.router.push(const MoodRatingRoute()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRatingButton(
    String title,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return CustomButton(
      text: title,
      onPressed: onPressed,
      icon: icon,
      height: 56,
      backgroundColor: Colors.white,
      textColor: AppStyle.textDark,
    );
  }
}
