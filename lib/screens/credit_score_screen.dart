import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/credit_score_rating_bar.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Interactive Credit Score Rating',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            CreditScoreRatingBar(
              score: _creditScore,
              maxScore: 850,
              onScoreChanged: (newScore) {
                setState(() {
                  _creditScore = newScore;
                });
              },
            ),
            const SizedBox(height: 40),
            Text(
              'Current Score: ${_creditScore.toInt()}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Drag the indicator to change the score',
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