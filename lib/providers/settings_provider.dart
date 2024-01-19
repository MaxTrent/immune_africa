import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:immune_africa/screens/screens.dart';

class SettingsProvider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;


  Future<void> signOut(BuildContext context) async {
    try {
      final User? user = _auth.currentUser;
      notifyListeners();
      if (user != null) {
    await _auth.signOut();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx)=> SignIn()), (route) => false);
    });
  }

    }catch(e){
      if (kDebugMode) {
        print('Failed to sign out $e');
      }
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