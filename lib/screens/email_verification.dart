import 'package:flutter/material.dart';
import 'package:immune_africa/screens/screens.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('EMAIL VERIFICATION', style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black)),
              Text('We have sent a confirmation to this email\njess002@gmail.com', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 22),),
              TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChooseLanguage()));}, child: Text('Resend Verification Link', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black),))
            ],
          ),
        ),
      ),
    );
  }
}
