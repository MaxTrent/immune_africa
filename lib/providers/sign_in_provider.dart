import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:immune_africa/data/storage.dart';

enum Status{Uninitialized, Authenticated, Authenticating, Unauthenticated}

class SignInProvider extends ChangeNotifier{
  bool _isButtonEnabled = false;
  bool _visible = false;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool get visible =>  _visible;
  bool get isButtonEnabled => _isButtonEnabled;
  Status _status = Status.Uninitialized;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn(BuildContext context, String email, String password) async {
    try {
      _isLoading = true;
      _status = Status.Authenticating;

      SharedPreferencesHelper.setLoggedIn();
      print('Innnnn');
      notifyListeners();
      final credential = await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
              (value) => Navigator.pushReplacementNamed(context, '/home'));
      User? user = _auth.currentUser;
      var id = user!.uid;
      if (kDebugMode) {
        print('User with $id is signed in');
      }
    } on FirebaseAuthException catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      if (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.code == 'invalid-email') {
        error(context, 'Wrong email or password.');
        if (kDebugMode) {
          print('No user found');
        }
      } else if (e.code == 'too-many-requests') {
        _status = Status.Unauthenticated;
        notifyListeners();
        error(context,
            'Account has been temporarily disabled due to too many failed attempts');
      } else {
        _status = Status.Unauthenticated;
        notifyListeners();
        error(context, e.message);
        if (kDebugMode) {
          print(e);
        }
      }
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      error(context, e);
      if (kDebugMode) {
        print(e);
      }
    }
    _isLoading = false;
    notifyListeners();
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


Future<void> changeButtonStatusTrue() async{
    _isButtonEnabled = true;
    notifyListeners();
}

  Future<void> changeButtonStatusFalse() async{
    _isButtonEnabled = false;
    notifyListeners();
  }

  Future<void> changeVisibility() async{
    _visible = !_visible;
    notifyListeners();
  }

  // Future<void> checkIfSignedIn(BuildContext context) async {
  //   User? user = _auth.currentUser;
  //
  //   if (user == null && user!.uid.isEmpty) {
  //     if (kDebugMode) {
  //       print('Not Signed In');
  //     }
  //   } else {
  //     SchedulerBinding.instance.addPostFrameCallback((_) {
  //       Navigator.pushReplacementNamed(context, '/home');
  //     });
  //   }
  // }
}