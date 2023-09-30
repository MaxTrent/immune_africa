import 'package:flutter/material.dart';
import 'package:immune_africa/Widgets/widgets.dart';
import 'package:immune_africa/screens/screens.dart';
import 'package:immune_africa/themes/app_themes.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                Text('Welcome!', style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black),),
                const SizedBox(height: 8,),
                Text('Let\'s get started!', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18),),
                const SizedBox(height: 40,),
                Text('First Name', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18),),
                TextFormField(
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: accentColor,
                      ),
                    ),
                  ),
                ),
                Text('Email Address', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18),),
                TextFormField(
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: accentColor,
                      ),
                    ),
                  ),
                ),
                Text('Password', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18),),
                TextFormField(
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: firstNameController,
                  decoration: const InputDecoration(

                    suffixIcon: Icon(Icons.visibility_off),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: accentColor,
                      ),
                    ),
                  ),
                ),
                Text('Confirm Password', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 18),),
                TextFormField(
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.visibility_off),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: accentColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                Center(
                  child: SizedBox(
                      height: 52,
                      width: 317,
                      child: AppButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> EmailVerification()));}, btnText: 'NEXT', btnBackgroundColor: accentColor, btnTextColor: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
