import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/gauge_rating_bar.dart';

@RoutePage()
class GaugeRatingScreen extends StatefulWidget {
  const GaugeRatingScreen({super.key});

  @override
  State<GaugeRatingScreen> createState() => _GaugeRatingScreenState();
}

class _GaugeRatingScreenState extends State<GaugeRatingScreen> {
  int _gaugeScore = 171;  // Changed initial score to match screenshot

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text(
          'Gauge Rating',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.pink[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const Text(
                'Interactive Gauge Rating',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 80),
              Center(
                child: GaugeRatingBar(
                  score: _gaugeScore,
                  maxScore: 999,
                  onScoreChanged: (newScore) {
                    setState(() {
                      _gaugeScore = newScore;
                    });
                  },
                ),
              ),
              const SizedBox(height: 80),
              Center(
                child: Text(
                  'Drag the indicator to change the score',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    letterSpacing: 0.5,
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