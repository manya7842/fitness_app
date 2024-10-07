// services/onboarding_check.dart
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingCheck {
  static const String _firstTimeKey = 'isFirstTimeUser';

  // Check if this is the first time the user opens the app
  Future<bool> isFirstTimeUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstTimeKey) ?? true;
  }

  // Mark that the onboarding has been shown
  Future<void> setFirstTimeUser(bool isFirstTime) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstTimeKey, isFirstTime);
  }
}
