import 'package:fitness_app/constants/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FitnessHomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class FitnessHomeScreen extends StatelessWidget {
  const FitnessHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Best Quarantine!'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Best for you',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const WorkoutChallengeCard(
              title: 'Belly Fat Burner',
              subtitle: 'Lose fat',
              color: Colors.orangeAccent,
            ),
            const SizedBox(height: 16),
            const WorkoutChallengeCard(
              title: 'Plank Sprint Squat',
              subtitle: 'Full body workout',
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 16),
            const WorkoutChallengeCard(
              title: 'Fast Warmup',
              subtitle: 'Get ready!',
              color: Colors.greenAccent,
            ),
            const SizedBox(height: 16),
            const Text(
              'Challenge yourself!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Action for Backward Turn
              },
              style: ElevatedButton.styleFrom(
                minimumSize:
                    const Size(double.infinity, 50), // Full-width button
              ),
              child: const Text('Backward Turn'),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutChallengeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const WorkoutChallengeCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
