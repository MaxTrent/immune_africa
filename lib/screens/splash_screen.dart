import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immune_africa/providers/providers.dart';
import 'package:immune_africa/screens/onboarding.dart';
import 'package:immune_africa/screens/screens.dart';
import 'package:provider/provider.dart';

import '../Widgets/widgets.dart';
import '../data/storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    Timer(
        const Duration(
          seconds: 5,
        ), () async {
      if (await SharedPreferencesHelper.isOnboardingCompleted()) {
        if (await SharedPreferencesHelper.isLoggedIn()) {
          // User logged in, navigate to PIN screen
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          // User not logged in, navigate to login screen
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => RegisterLogin())
          );
        }
      } else {
        // Onboarding not completed, navigate to onboarding screen
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Onboarding()));
      }
    });
    super.initState();
  }
  //
  // Future<void> checkIfSignedIn() async {
  //   User? user = _auth.currentUser;
  //
  //   if (user == null || user.uid.isEmpty) {
  //     if (kDebugMode) {
  //       print('Not Signed In');
  //       Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => Onboarding()));
  //     }
  //   } else {
  //       Navigator.pushReplacementNamed(context, '/home');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
                // height: 1000,
                width: 400.w,
                child: SvgPicture.asset('assets/logo_background.svg')),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: const Color(0xffA564D3).withOpacity(0.85),
            ),
            child: const AppLogo(),
          ),
        ],
      ),
    );
  }
}
