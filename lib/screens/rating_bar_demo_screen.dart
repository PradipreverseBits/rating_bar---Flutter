import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../routes/app_router.dart';

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
      appBar: AppBar(
        title: const Text('Rating Bar Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Select Rating Type',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              _buildRatingButton(
                context,
                'Default Rating',
                Icons.star_border,
                () => context.router.push(const DefaultRatingRoute()),
              ),
              const SizedBox(height: 20),
              _buildRatingButton(
                context,
                'Gauge Rating',
                Icons.speed,
                () => context.router.push(const GaugeRatingRoute()),
              ),
              const SizedBox(height: 20),
              _buildRatingButton(
                context,
                'Credit Score Rating',
                Icons.credit_score,
                () => context.router.push(const CreditScoreRoute()),
              ),
              const SizedBox(height: 20),
              _buildRatingButton(
                context,
                'Star Rating',
                Icons.star,
                () => context.router.push(const StarRatingRoute()),
              ),
              const SizedBox(height: 20),
              _buildRatingButton(
                context,
                'Heart Rating',
                Icons.favorite,
                () => context.router.push(const HeartRatingRoute()),
              ),
              const SizedBox(height: 20),
              _buildRatingButton(
                context,
                'Emoji Rating',
                Icons.emoji_emotions,
                () => context.router.push(const EmojiRatingRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingButton(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
