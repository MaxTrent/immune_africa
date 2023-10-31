import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  const CircleAvatar(backgroundImage: AssetImage('assets/baby2.png'), radius: 30,),
                  Text('Jessica Doe', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18),),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
