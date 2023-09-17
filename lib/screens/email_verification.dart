import 'package:flutter/material.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('EMAIL VERIFICATION'),
              const Text('We have sent a confirmation to this email jess002@gmail.com', textAlign: TextAlign.center,),
              TextButton(onPressed: (){}, child: Text('Resend Verification Link', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black),))
            ],
          ),
        ),
      ),
    );
  }
}
