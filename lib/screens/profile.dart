import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:immune_africa/screens/individual_signup.dart';
import 'package:immune_africa/screens/phone_registration.dart';

import '../providers/profile_state.dart';
import '../themes/themes.dart';


final currentEmailProvider = StateProvider<String>((ref) {
  final user = FirebaseAuth.instance.currentUser;
  return user?.email ?? '';
});

final currentFullNameProvider = StateProvider<String>((ref) {
  final user = FirebaseAuth.instance.currentUser;
  return user?.displayName ?? '';
});

final currentPhoneProvider = StateProvider<String>((ref) {
  final user = FirebaseAuth.instance.currentUser;
  return user?.phoneNumber ?? '';
});

final countryProvider = StateProvider<String>((ref) => '');

final readOnlyProvider = StateProvider.family<bool, String>((ref, id) => true);
//
// final fullNameProvider = StateProvider<String?>((ref) => null);

class Profile extends ConsumerWidget {
  Profile({super.key});

  // final _firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);

  // final _user = FirebaseAuth.instance.currentUser;
  // final fullNameProvider = StateProvider<String>((ref) => '');

  // final emailProvider = StateProvider<String>((ref) => '');

  @override
  Widget build(BuildContext context, ref) {
    final displayName = ref
        .watch(currentFullNameProvider.notifier)
        .state;
    final email = ref
        .watch(currentEmailProvider.notifier)
        .state;
    final phone = ref
        .watch(currentPhoneProvider.notifier)
        .state;
    final country = ref
        .watch(countryProvider.notifier)
        .state;

    final _fullNameController = TextEditingController(text: displayName);
    final _emailController = TextEditingController(text: email);
    final _passwordController = TextEditingController(text: '******');
    final _phoneController =
    TextEditingController(text: phone);
    final _countryController = TextEditingController(text: country);


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      CircleAvatar(
                        backgroundImage: const AssetImage('assets/baby2.png'),
                        radius: 30.r,
                      ),
                      Text(
                        displayName,
                        style: Theme
                            .of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.black, fontSize: 18.sp),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Text(
                  'Profile',
                  style: Theme
                      .of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Full Name',
                  style: Theme
                      .of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.grey),
                ),
                TextFormField(
                  autofocus: true,
                  onChanged: (value) {
                    ref
                        .read(currentFullNameProvider.notifier)
                        .state = value;
                  },
                  // onFieldSubmitted: ,
                  // enabled: ref.watch(readOnlyProvider('button1')),
                  readOnly: ref.watch(readOnlyProvider('button1')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z]+|\s"),
                    )
                  ],
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Full Name is required';
                    } else if (value.startsWith(RegExp(r'[0-9]'))) {
                      return 'Full Name is not valid';
                    }
                  },
                  cursorColor: primaryAppColor,
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Image.asset('assets/edit.png'),
                      onPressed: () {
                        final currentStatus = ref
                            .read(readOnlyProvider('button1').notifier)
                            .state;
                        ref
                            .read(readOnlyProvider('button1').notifier)
                            .state =
                        !currentStatus;

                        if (!currentStatus) {
                          final newFullName =
                              ref
                                  .watch(currentFullNameProvider.notifier)
                                  .state;
                          final user = FirebaseAuth.instance.currentUser;
                          user?.updateDisplayName(newFullName);

                          // Update the text controller
                          _fullNameController.text = newFullName;
                        }
                      },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Email Address',
                  style: Theme
                      .of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.grey),
                ),
                TextFormField(
                  readOnly: ref.watch(readOnlyProvider('button2')),
                  validator: (value) {
                    if (!value!.isValidEmail || value.isEmpty) {
                      return 'Enter a valid email address';
                    }
                  },
                  onChanged: (value) {
                    ref
                        .read(currentEmailProvider.notifier)
                        .state = value;
                  },
                  cursorColor: primaryAppColor,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Image.asset('assets/edit.png'),
                      onPressed: () {
                        // final currentStatus = ref
                        //     .read(readOnlyProvider('button2').notifier)
                        //     .state;
                        // ref.read(readOnlyProvider('button2').notifier).state =
                        // !currentStatus;
                        //
                        // if (!currentStatus) {
                        //   final newEmail =
                        //       ref.watch(currentEmailProvider.notifier).state;
                        //   final user = FirebaseAuth.instance.currentUser;
                        //   user?.updateEmail(newEmail);
                        //
                        //   _emailController.text = newEmail;
                        // }
                      },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Password',
                  style: Theme
                      .of(context)
                      .textTheme
                      .displaySmall!
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
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Phone Number',
                  style: Theme
                      .of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.grey),
                ),
                TextFormField(
                  readOnly: ref.watch(readOnlyProvider('button3')),
                  validator: (value) {
                    if (!value!.isValidPhone) {
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
                  onChanged: (value){
                    ref.read(currentPhoneProvider.notifier).state = value;
                  },
                  controller: _phoneController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Image.asset('assets/edit.png'),
                      onPressed: () {
                        final currentStatus = ref
                            .read(readOnlyProvider('button3').notifier)
                            .state;
                        ref
                            .read(readOnlyProvider('button3').notifier)
                            .state =
                        !currentStatus;

                        if (!currentStatus) {
                          final newPhone =
                              ref
                                  .watch(currentFullNameProvider.notifier)
                                  .state;
                          // final user = FirebaseAuth.instance.currentUser;
                          // user?.updatePhoneNumber(newPhone);

                          // Update the text controller
                          _phoneController.text = newPhone;
                        }
                      },
                    ),
                    fillColor: Colors.white,
                    prefixIcon: SizedBox(
                      width: 75.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '  +234',
                            style: Theme
                                .of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.black),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0.r),
                            child: const VerticalDivider(
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Country of Residence',
                  style: Theme
                      .of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.grey),
                ),
                TextFormField(
                  readOnly: ref.watch(readOnlyProvider('button4')),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z]+|\s"),
                    )
                  ],
                  onChanged: (value) {
                    ref
                        .read(countryProvider.notifier)
                        .state = value;
                  },
                  // validator: (value) {
                  //   if (value!.trim().isEmpty) {
                  //     return 'First Name is required';
                  //   } else if (value.startsWith(RegExp(r'[0-9]'))) {
                  //     return 'First name is not valid';
                  //   }
                  // },
                  cursorColor: primaryAppColor,
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _countryController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Image.asset('assets/edit.png'),
                      onPressed: () {
                        final currentStatus = ref
                            .read(readOnlyProvider('button4').notifier)
                            .state;
                        ref
                            .read(readOnlyProvider('button4').notifier)
                            .state =
                        !currentStatus;

                        if (!currentStatus) {
                          final newCountry =
                              ref
                                  .watch(countryProvider.notifier)
                                  .state;
                          final user = FirebaseAuth.instance.currentUser;
                          // user?.

                          // Update the text controller
                          _countryController.text = newCountry;
                        }
                      },
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
