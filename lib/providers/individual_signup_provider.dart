

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/screens.dart';

class IndividualSignUpProvider extends ChangeNotifier {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;
  bool _isEmailVerified = false;

  bool get isLoading => _isLoading;

  bool get isPasswordVisible => _isPasswordVisible;

  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;
  bool _isButtonEnabled = false;
  bool get isEmailVerified => _isEmailVerified;

  bool get isButtonEnabled => _isButtonEnabled;
  final _auth = FirebaseAuth.instance;

  // final _firstNameController = TextEditingController();
  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();

  Future<void> changeButtonStatusTrue() async {
    _isButtonEnabled = true;
    notifyListeners();
  }

  Future<void> changeButtonStatusFalse() async {
    _isButtonEnabled = false;
    notifyListeners();
  }

  Future<void> changeVisibilityPassword() async {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<void> changeVisibilityConfirm() async {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  Future<void> verifyEmail(BuildContext context) async {
    final user = _auth.currentUser;
    // user!.reload();
    if (!user!.emailVerified) {
      await user.sendEmailVerification();
      print('email verified');
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => Home()),
      // );
    }
  }

  Future<void> checkEmailVerification(BuildContext context) async{
    var user = _auth.currentUser;
    print("Before reload: ${user!.emailVerified}");
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      await user!.reload();
      user = _auth.currentUser;

      print("After reload: ${user!.emailVerified}");
      if (user!.emailVerified) {
        timer.cancel();
        // Navigator.pop(context, true);
      }
    });

    _isEmailVerified = user!.emailVerified;



    if(_isEmailVerified){
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Email Successfully Verified")));
    }
    print(_isEmailVerified);
    notifyListeners();
  }

  Future<void> signUp(BuildContext context, String username, String firstName,
      String password) async {
    // String pword = _passwordController.text.toString();
    try {
      _isLoading = true;
      notifyListeners();
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: username, password: password);
      // .then((value) =>
      // print('user with user id ${value.user!.uid} is logged in'));

      User? user = credential.user;
      if (user != null) {
        user.updateDisplayName(firstName);
        print('update successful. first name is $firstName');
      }

      bool addData = await sendToDB(firstName, username);
      await verifyEmail(context);
      if (kDebugMode) {
        print('add data ${addData.toString()}');
      }
      if (addData == true) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EmailVerification()));
      } else {
        error(context, 'Error signing up');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        error(context, 'Password is weak');
      } else if (e.code == 'email-already-in-use') {
        User? user = _auth.currentUser;
        if (user!.uid.isNotEmpty) {
          bool userExist = await doesUserAlreadyExist(user.uid);
          if (userExist == true) {
            error(context, 'This account exists');
          } else {
            bool addData = await sendToDB(firstName, username);
            if (kDebugMode) {
              print('add data ${addData.toString()}');
            }
            if (addData == true) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Dashboard()));
            } else {
              error(context, 'Error signing user up');
            }
          }
        } else {
          error(context, 'This account exists');
        }
      } else if (e.code == 'invalid-email') {
        error(context, 'Invalid Email');
      } else {
        error(context, e.message);
        if (kDebugMode) {
          print(e);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> sendToDB(String firstname, String email) async {
    User? user = _auth.currentUser;
    if (user!.uid.isNotEmpty) {
      try {
        CollectionReference users =
            FirebaseFirestore.instance.collection('parents');
        await users.add({
          "firstname": firstname,
          // "lastname": lastname,
          "email": email,
          "userId": user.uid,
          "amount": 0,
          "amountReset": 0,
          "lastResetTime": DateTime.now()
        });
        return true;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  Future<bool> doesUserAlreadyExist(String uid) async {
    final dynamic values = await FirebaseFirestore.instance
        .collection("users")
        .where('userId', isEqualTo: uid)
        .limit(1)
        .get();

    if (values.size >= 1) {
      return true;
    } else {
      return false;
    }
  }

  void error(BuildContext context, errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red[600],
        elevation: 0,
        content: Text(
          errorMessage,
          textAlign: TextAlign.center,
        )));
  }
}
