import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../themes/themes.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final _auth = FirebaseAuth.instance;
  User? _user;

  @override
  Widget build(BuildContext context) {
    _user = _auth.currentUser;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20,),
                      const CircleAvatar(backgroundImage: AssetImage('assets/baby2.png'), radius: 30,),
                      Text('${_user!.displayName}', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18),),
                    ],
                  ),
                ),
                Divider(),
                Text('Profile', style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black),),
                SizedBox(height: 30,),
                Text(
                  'Full Name',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.grey),
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
                SizedBox(height: 30,),
                Text(
                  'Email Address',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.grey),
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
                SizedBox(height: 30,),
                Text(
                  'Password',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.grey),
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
                SizedBox(height: 30,),
                Text(
                  'Phone Number',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.grey),
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
                SizedBox(height: 30,),
                Text(
                  'Country of Residence',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.grey),
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
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
