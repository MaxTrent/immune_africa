import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../screens/screens.dart';

class HospitalSignUpProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isButtonEnabled = false;
  bool _isPasswordVisible = false;
  final _auth = FirebaseAuth.instance;

  bool get isButtonEnabled => _isButtonEnabled;

  bool get isLoading => _isLoading;

  bool get isPasswordVisible => _isPasswordVisible;

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

  Future<void> signUp(
      BuildContext context,
      String username,
      String hospitalName,
      String country,
      String address,
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
        user.updateDisplayName(hospitalName);
        print('update successful. first name is $hospitalName');
      }

      bool addData = await sendToDB(hospitalName, username, country, address);
      await verifyEmail(context);
      if (kDebugMode) {
        print('add data ${addData.toString()}');
      }
      if (addData == true) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => EmailVerification()));
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
            bool addData =
                await sendToDB(hospitalName, username, country, address);
            if (kDebugMode) {
              print('add data ${addData.toString()}');
            }
            if (addData == true) {
              return;
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => Dashboard()));
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

  Future<bool> sendToDB(
      String firstname, String email, String country, String address) async {
    User? user = _auth.currentUser;
    if (user!.uid.isNotEmpty) {
      try {
        CollectionReference users =
            FirebaseFirestore.instance.collection('hospital');
        await users.add({
          "hospitalName": firstname,
          // "lastname": lastname,
          "hospitalEmail": email,
          "hospitalId": user.uid,
          "country": country,
          "address": address,
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
        .collection("hospital")
        .where('hospitalId', isEqualTo: uid)
        .limit(1)
        .get();

    if (values.size >= 1) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> verifyEmail(BuildContext context) async {
    final user = _auth.currentUser;
    // user!.reload();

    try {
      if (!user!.emailVerified) {
        await user.sendEmailVerification();
        print('email verified');
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => Home()),
        // );
      }
    } on FirebaseAuthException catch (e) {
      error(context, e);
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

  void success(BuildContext context, successMessage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green[600],
        elevation: 0,
        content: Text(
          successMessage,
          textAlign: TextAlign.center,
        )));
  }
}
