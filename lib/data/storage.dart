import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final storage = FlutterSecureStorage();

class SharedPreferencesHelper{

  static const String onboardingKey = 'onboarding';
  static const String loggedInKey = 'loggedIn';

  // Set onboarding as completed
  static Future<void> setOnboardingCompleted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(onboardingKey, true);
  }

  // Check if onboarding is completed
  static Future<bool> isOnboardingCompleted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onboardingKey) ?? false;
  }

  // Set user as logged in
  static Future<void> setLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(loggedInKey, true);
  }

  // Set user as logged out
  static Future<void> setLoggedOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(loggedInKey, false);
  }

  // Check if the user is logged in
  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loggedInKey) ?? false;
  }

}

