import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';

FirebaseAuth auth = FirebaseAuth.instance;

Future<void> signIn(BuildContext context, email, password) async {
  try {
    final credential = await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
            (value) => Navigator.pushReplacementNamed(context, '/homepage'));
    User? user = auth.currentUser;
    var id = user!.uid;
    if (kDebugMode) {
      print('User with $id is signed in');
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found' ||
        e.code == 'wrong-password' ||
        e.code == 'invalid-email') {
      error(context, 'Wrong email or password.');
      if (kDebugMode) {
        print('No user found');
      }
    } else if (e.code == 'too-many-requests') {
      error(context,
          'Account has been temporarily disabled due to too many failed attempts');
    } else {
      error(context, e.message);
      if (kDebugMode) {
        print(e);
      }
    }
  } catch (e) {
    error(context, e);
    if (kDebugMode) {
      print(e);
    }
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
