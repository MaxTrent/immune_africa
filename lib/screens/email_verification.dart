import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:immune_africa/providers/providers.dart';
import 'package:immune_africa/screens/screens.dart';
import 'package:provider/provider.dart';

import '../themes/app_themes.dart';

class EmailVerification extends StatelessWidget {
  EmailVerification({super.key});

  User? user;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
user = _auth.currentUser;
    return ChangeNotifierProvider<IndividualSignUpProvider>(
      create: (_) => IndividualSignUpProvider(),
      builder: (context, child) => Scaffold(
        body: SafeArea(
          child: FutureBuilder(
          future: context.read<IndividualSignUpProvider>().checkEmailVerification(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('EMAIL VERIFICATION',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.black)),
                    Text(
                      'We have sent a confirmation to this email\n${user!.email}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 22.sp),
                    ),
                    TextButton(
                        onPressed: () {
                          context
                              .read<IndividualSignUpProvider>()
                              .verifyEmail(context);
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChooseLanguage()));
                        },
                        child: Text(
                          'Resend Verification Link',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: Colors.black),
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                        height: 30.h,
                        width: 35.w,
                        child: const CircularProgressIndicator(
                          color: primaryAppColor,
                          // strokeWidth: 2,
                        )),
                  ],
                ),
              );
            } else if (context.watch<IndividualSignUpProvider>().isEmailVerified){

              return Container();
            }
            else{
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('EMAIL VERIFICATION',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.black)),
                    Text(
                      'We have sent a confirmation to this email\n${user!.email}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 22.sp),
                    ),
                    TextButton(
                        onPressed: () {
                          context
                              .read<IndividualSignUpProvider>()
                              .verifyEmail(context);
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChooseLanguage()));
                        },
                        child: Text(
                          'Resend Verification Link',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: Colors.black),
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                        height: 30.h,
                        width: 35.w,
                        child: const CircularProgressIndicator(
                          color: primaryAppColor,
                          // strokeWidth: 2,
                        )),
                  ],
                ),
              );
            }
          },
        ),
        ),
      ),
    );
  }
}
