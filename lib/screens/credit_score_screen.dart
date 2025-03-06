import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/credit_score_rating_bar.dart';
import '../theme.dart';

@RoutePage()
class CreditScoreScreen extends StatefulWidget {
  const CreditScoreScreen({super.key});

  @override
  State<CreditScoreScreen> createState() => _CreditScoreScreenState();
}

class _CreditScoreScreenState extends State<CreditScoreScreen> {
  double _creditScore = 750.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Score Rating'),
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
                'Interactive Credit Score Rating',
                style: AppStyle.heading.copyWith(
                  color: AppStyle.textDark,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: AppStyle.sp32 * 2),
              CreditScoreRatingBar(
                score: _creditScore,
                maxScore: 850,
                onScoreChanged: (newScore) {
                  setState(() {
                    _creditScore = newScore;
                  });
                },
              ),
              const SizedBox(height: AppStyle.sp32 * 2),
              Center(
                child: Text(
                  'Current Score: ${_creditScore.toInt()}',
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
                  'Drag the indicator to change the score',
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
