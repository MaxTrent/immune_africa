import 'package:flutter/material.dart';
import 'package:immune_africa/screens/screens.dart';
import 'package:provider/provider.dart';

import '../Widgets/widgets.dart';
import '../providers/providers.dart';
import '../themes/themes.dart';

class HospitalSignUp extends StatelessWidget {
  HospitalSignUp({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HospitalSignUpProvider>(
        create: (_) => HospitalSignUpProvider(),
        builder: ((context, child) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Welcome!',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Let\'s get started!',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.black, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Name of Hospital',
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Hospital\'s Email Address',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.black, fontSize: 18),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // controller: _emailController,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: accentColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Country',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.black, fontSize: 18),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // controller: _emailController,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: accentColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Address',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.black, fontSize: 18),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // controller: _emailController,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: accentColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Password',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.black, fontSize: 18),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // controller: _passwordController,
                        obscureText: context.read<HospitalSignUpProvider>().visible ? false : true,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: () {
                            context.read<HospitalSignUpProvider>().changeVisibility();
                          },
                              icon: context.watch<HospitalSignUpProvider>().visible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: accentColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Text(
                      //   'Confirm Password',
                      //   style: Theme.of(context)
                      //       .textTheme
                      //       .headline1!
                      //       .copyWith(color: Colors.black, fontSize: 18),
                      // ),
                      // TextFormField(
                      //   keyboardType: TextInputType.name,
                      //   autovalidateMode: AutovalidateMode.onUserInteraction,
                      //   obscureText: context.read<HospitalSignUpProvider>().visible ? false : true,
                      //   // controller: _confirmPasswordController,
                      //   decoration: InputDecoration(
                      //     suffixIcon: IconButton(onPressed: () {
                      //       context.read<HospitalSignUpProvider>().changeVisibility();
                      //     },
                      //         icon: context.watch<HospitalSignUpProvider>().visible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
                      //     enabledBorder: const UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //         color: accentColor,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: SizedBox(
                            height: 52,
                            width: 317,
                            child: AppButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          RegisterSuccess(callback: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Home()));})));
                                },
                                btnText: 'NEXT',
                                btnBackgroundColor: accentColor,
                                btnTextColor: Colors.white)),
                      ),
                      SizedBox(height: 30,)
                    ],
                  ),
                ),
              ),
            ),
          ),
        )));
  }
}
