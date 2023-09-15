import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:immune_africa/screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(
        const Duration(
          seconds: 5,
        ), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Onboarding()));
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: SizedBox(
                  // height: 1000,
                  width: 400,
                  child: SvgPicture.asset('assets/logo_background.svg')),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color(0xffA564D3).withOpacity(0.85),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/typeface.svg'),
                  SvgPicture.asset('assets/logo.svg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
