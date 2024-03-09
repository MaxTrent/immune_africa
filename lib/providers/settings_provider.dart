import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:immune_africa/screens/screens.dart';

import '../data/storage.dart';

class SettingsProvider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  bool _loading = false;

  bool get loading => _loading;

  Future<void> signOut(BuildContext context) async {
    try {
      final User? user = _auth.currentUser;
      _loading = true;
      notifyListeners();
      if (user != null) {
        await Future.delayed(const Duration(seconds: 2), () async {
          await _auth.signOut();
          if (kDebugMode) {
            print('Signed Out');
          }
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SignIn()),
              (route) => false);
        });
        SharedPreferencesHelper.setLoggedOut();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Failed to sign out $e');
      }
      _loading = false;
      error(context, e);
    }
  }

  error(BuildContext context, errorMessage) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          width: MediaQuery.of(context).size.width,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red[600],
          elevation: 0,
          content: Text(
            errorMessage,
            textAlign: TextAlign.center,
          ),
        ),
      );
    });
  }
}
