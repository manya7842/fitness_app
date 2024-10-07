import 'package:flutter/material.dart';
import '../../services/onboarding_check.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  // Function to navigate to the home screen and mark onboarding as completed
  Future<void> _completeOnboarding(BuildContext context) async {
    final onboardingCheck = OnboardingCheck();
    await onboardingCheck.setFirstTimeUser(false);  // Mark onboarding as completed
    Navigator.pushReplacementNamed(context, '/bottomNavigationbar');  // Navigate to Bottom Navbar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image section
          Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/onboardingImages/bellyfat.jpg',  // Your fitness image here
                  fit: BoxFit.cover,  // Ensures image covers the space properly
                ),
                Container(
                  color: Colors.black.withOpacity(0.3), // Semi-transparent overlay for contrast
                ),
              ],
            ),
          ),

          // Text Section
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Wherever You Are",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Health Is Number One",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "There is no instant way to a healthy life",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Progress bar representation
                  Container(
                    width: 60,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Button Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,  // Black background for the button
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                _completeOnboarding(context);  // Call the function to navigate
              },
              child: const Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,  // White text for the button
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
