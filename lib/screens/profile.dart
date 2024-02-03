import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:immune_africa/screens/individual_signup.dart';
import 'package:immune_africa/screens/phone_registration.dart';

import '../themes/themes.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final _auth = FirebaseAuth.instance;
  User? _user;

  @override
  Widget build(BuildContext context) {
    _user = _auth.currentUser;

    final _fullNameController = TextEditingController(text: '${_user!.displayName}');
    final _emailController = TextEditingController(text: '${_user!.email}');
    final _passwordController = TextEditingController(text: '******');
    final _phoneController = TextEditingController(text: _user?.phoneNumber??'_ _ _ _ _ _ _ _ _ _');
    final _countryController = TextEditingController(text: '');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                const Divider(),
                Text('Profile', style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black),),
                const SizedBox(height: 30,),
                Text(
                  'Full Name',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.grey),
                ),
                TextFormField(
                  readOnly: true,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z]+|\s"),
                    )
                  ],
                  validator: (value) {
                    if (value!
                        .trim()
                        .isEmpty) {
                      return 'First Name is required';
                    } else if (value
                        .startsWith(
                        RegExp(r'[0-9]'))) {
                      return 'First name is not valid';
                    }
                  },
                  // onChanged: (value) {
                  //   if (value.isNotEmpty) {
                  //     context
                  //         .read<IndividualSignUpProvider>()
                  //         .changeButtonStatusTrue();
                  //   } else {
                  //     context
                  //         .read<IndividualSignUpProvider>()
                  //         .changeButtonStatusFalse();
                  //   }
                  // },
                  cursorColor: primaryAppColor,
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: accentColor,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryAppColor,
                      ),

                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: (Colors.red[200])!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Text(
                  'Email Address',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.grey),
                ),
                TextFormField(
                  readOnly: true,
                  validator: (value) {
                    if (!value!.isValidEmail || value.isEmpty) {
                      return 'Enter a valid email address';
                    }
                  },
                  // onChanged: (value) {
                  //   if (value.isNotEmpty) {
                  //     context
                  //         .read<IndividualSignUpProvider>()
                  //         .changeButtonStatusTrue();
                  //   } else {
                  //     context
                  //         .read<IndividualSignUpProvider>()
                  //         .changeButtonStatusFalse();
                  //   }
                  // },
                  cursorColor: primaryAppColor,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailController,
                  decoration: InputDecoration(

                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: accentColor,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryAppColor,
                      ),

                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: (Colors.red[200])!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Text(
                  'Password',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.grey),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return 'Password must be at least 6  character';
                    }
                  },
                  enableInteractiveSelection: false,
                  // onChanged: (value) {
                  //   if (value.isNotEmpty) {
                  //     context
                  //         .read<IndividualSignUpProvider>()
                  //         .changeButtonStatusTrue();
                  //   } else {
                  //     context
                  //         .read<IndividualSignUpProvider>()
                  //         .changeButtonStatusFalse();
                  //   }
                  // },
                  cursorColor: primaryAppColor,
                  readOnly: true,
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordController,
                  // obscureText: context
                  //     .read<IndividualSignUpProvider>()
                  //     .isPasswordVisible
                  //     ? false
                  //     : true,
                  decoration: InputDecoration(
                    // suffixIcon: IconButton(
                    //     onPressed: () {
                    //       context
                    //           .read<IndividualSignUpProvider>()
                    //           .changeVisibilityPassword();
                    //     },
                    //     icon: context
                    //         .watch<IndividualSignUpProvider>()
                    //         .isPasswordVisible
                    //         ? const Icon(
                    //       Icons.visibility,
                    //       color: primaryAppColor,
                    //     )
                    //         : const Icon(
                    //       Icons.visibility_off,
                    //       color: accentColor,
                    //     )),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: accentColor,
                      ),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: (Colors.red[200])!,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryAppColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Text(
                  'Phone Number',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.grey),
                ),
                TextFormField(
                  readOnly: true,
                  validator: (value){
                    if(!value!.isValidPhone){
                      return 'Invalid Phone Number';
                    }
                  },
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[0-9]"),
                    ),
                  ],
                  controller: _phoneController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: SizedBox(
                        width: 75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '  +234',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: Colors.black),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: VerticalDivider(
                                color: Colors.black,
                                width: 5,
                                thickness: 1,
                              ),
                            )
                          ],
                        ),
                      ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: accentColor,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryAppColor,
                      ),

                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: (Colors.red[200])!,
                      ),
                    ),),
                ),
                const SizedBox(height: 30,),
                Text(
                  'Country of Residence',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.grey),
                ),
                TextFormField(
                  readOnly: true,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z]+|\s"),
                    )
                  ],
                  validator: (value) {
                    if (value!
                        .trim()
                        .isEmpty) {
                      return 'First Name is required';
                    } else if (value
                        .startsWith(
                        RegExp(r'[0-9]'))) {
                      return 'First name is not valid';
                    }
                  },
                  // onChanged: (value) {
                  //   if (value.isNotEmpty) {
                  //     context
                  //         .read<IndividualSignUpProvider>()
                  //         .changeButtonStatusTrue();
                  //   } else {
                  //     context
                  //         .read<IndividualSignUpProvider>()
                  //         .changeButtonStatusFalse();
                  //   }
                  // },
                  cursorColor: primaryAppColor,
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _countryController,
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: accentColor,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryAppColor,
                      ),

                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: (Colors.red[200])!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
