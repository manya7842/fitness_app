import 'package:flutter/material.dart';
import 'services/onboarding_check.dart';  
import 'screens/ProfilePage/profilePage.dart';
import 'screens/homeScreen/bottomNavigationbar.dart';
import 'screens/homeScreen/homeScreen.dart';
import 'screens/ProfilePage/PrivacyPolicy.dart';
import 'screens/ProfilePage/SettingsPage.dart';
import 'screens/onboardingscreen/onboarding.dart';  

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isFirstTimeUser = true;

  @override
  void initState() {
    super.initState();
    _checkFirstTimeUser();
  }

  Future<void> _checkFirstTimeUser() async {
    final onboardingCheck = OnboardingCheck();  // Instantiate the utility class
    bool isFirstTime = await onboardingCheck.isFirstTimeUser();

    setState(() {
      _isFirstTimeUser = isFirstTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      routes: {
        '/home': (context) => const HomePage(),
        '/bottomNavigationbar': (context) => const HomepageNavbar(),
        '/profile': (context) => const ProfilePage(),
        '/privacyPolicy': (context) => const PrivacyPolicyPage(),
        '/settings': (context) => const SettingsPage(),
        '/onboarding': (context) => const OnboardingScreen(),  // Add onboarding route
      },
      debugShowCheckedModeBanner: false,
      home: _isFirstTimeUser ? const OnboardingScreen() : const HomepageNavbar(),
    );
  }
}
