import 'package:flutter/material.dart';

import '../themes/themes.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Text('Profile', style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black),),
              Text(
                'First Name',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.black, fontSize: 18),
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // controller: _firstNameController,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: accentColor,
                    ),
                  ),
                ),
              ),
              Text(
                'Last Name',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.black, fontSize: 18),
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // controller: _firstNameController,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: accentColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
