import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:immune_africa/screens/screens.dart';
import 'package:provider/provider.dart';

import '../Widgets/widgets.dart';
import '../providers/providers.dart';
import '../themes/themes.dart';

class HospitalSignUp extends StatelessWidget {
  HospitalSignUp({super.key});

  final _hospitalNameController = TextEditingController();
  final _hospitalEmailController = TextEditingController();
  final _countryController = TextEditingController(text: 'Nigeria');
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();
  String? password;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HospitalSignUpProvider>(
        create: (_) => HospitalSignUpProvider(),
        builder: ((context, child) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            'Welcome!',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            'Let\'s get started!',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.black, fontSize: 18.sp),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            'Name of Hospital',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.black, fontSize: 18.sp),
                          ),
                          TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(30),
                              FilteringTextInputFormatter.allow(
                                RegExp(r"[a-zA-Z]+|\s"),
                              ),
                            ],
                            validator: (val) {
                              if (val!.length < 3 || val.isEmpty) {
                                return 'Enter a valid First name';
                              }
                            },
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                context
                                    .read<HospitalSignUpProvider>()
                                    .changeButtonStatusTrue();
                              } else {
                                context
                                    .read<HospitalSignUpProvider>()
                                    .changeButtonStatusFalse();
                              }
                            },
                            cursorColor: primaryAppColor,
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _hospitalNameController,
                            decoration: InputDecoration(
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: (Colors.red[200])!,
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
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Hospital\'s Email Address',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.black, fontSize: 18.sp),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (!value!.isValidEmail || value.isEmpty) {
                                return 'Enter a valid email address';
                              }
                            },
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                context
                                    .read<HospitalSignUpProvider>()
                                    .changeButtonStatusTrue();
                              } else {
                                context
                                    .read<HospitalSignUpProvider>()
                                    .changeButtonStatusFalse();
                              }
                            },
                            cursorColor: primaryAppColor,
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _hospitalEmailController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: accentColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
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
                            height: 10.h,
                          ),
                          Text(
                            'Country',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.black, fontSize: 18.sp),
                          ),
                          TextFormField(
                            readOnly: true,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(30),
                              FilteringTextInputFormatter.allow(
                                RegExp(r"[a-zA-Z]+|\s"),
                              ),
                            ],
                            validator: (val) {
                              if (val!.length < 3 || val.isEmpty) {
                                return 'Enter a valid Country';
                              }
                            },
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                context
                                    .read<HospitalSignUpProvider>()
                                    .changeButtonStatusTrue();
                              } else {
                                context
                                    .read<HospitalSignUpProvider>()
                                    .changeButtonStatusFalse();
                              }
                            },
                            cursorColor: primaryAppColor,
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _countryController,
                            decoration: InputDecoration(
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: (Colors.red[200])!,
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
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Address',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.black, fontSize: 18.sp),
                          ),
                          TextFormField(
                            // inputFormatters: [
                            //   LengthLimitingTextInputFormatter(30),
                            //   FilteringTextInputFormatter.allow(
                            //     RegExp(r"[a-zA-Z]+|\s"),
                            //   ),
                            // ],
                            validator: (val) {
                              if (val!.length < 3 || val.isEmpty) {
                                return 'Enter a valid First name';
                              }
                            },
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                context
                                    .read<HospitalSignUpProvider>()
                                    .changeButtonStatusTrue();
                              } else {
                                context
                                    .read<HospitalSignUpProvider>()
                                    .changeButtonStatusFalse();
                              }
                            },
                            cursorColor: primaryAppColor,
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _addressController,
                            decoration: InputDecoration(
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: (Colors.red[200])!,
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
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Password',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.black, fontSize: 18.sp),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty || value.length < 6) {
                                return 'Password must be at least 6  character';
                              } else {
                                password = value;
                              }
                            },
                            enableInteractiveSelection: false,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                context
                                    .read<HospitalSignUpProvider>()
                                    .changeButtonStatusTrue();
                              } else {
                                context
                                    .read<HospitalSignUpProvider>()
                                    .changeButtonStatusFalse();
                              }
                            },
                            cursorColor: primaryAppColor,
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _passwordController,
                            obscureText: context
                                    .read<HospitalSignUpProvider>()
                                    .isPasswordVisible
                                ? false
                                : true,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    context
                                        .read<HospitalSignUpProvider>()
                                        .changeVisibilityPassword();
                                  },
                                  icon: context
                                          .watch<HospitalSignUpProvider>()
                                          .isPasswordVisible
                                      ? const Icon(
                                          Icons.visibility,
                                          color: primaryAppColor,
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          color: accentColor,
                                        )),
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
                            height: 10.h,
                          ),
                          // Text(
                          //   'Confirm Password',
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .displaySmall!
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
                          SizedBox(
                            height: 50.h,
                          ),
                          Center(
                            child: context
                                .watch<HospitalSignUpProvider>()
                                .isLoading
                                ?  SizedBox(
                              height: 30.h,
                              width: 35.w,
                              child: CircularProgressIndicator(
                                color: primaryAppColor,
                                // strokeWidth: 2,
                              ),
                            )
                                : SizedBox(
                                height: 52.h,
                                width: 317.w,
                                child: AppButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        context
                                            .read<HospitalSignUpProvider>()
                                            .signUp(
                                                context,
                                                _hospitalEmailController.text
                                                    .toString(),
                                                _hospitalNameController.text
                                                    .toString(),
                                                _countryController.text
                                                    .toString(),
                                                _addressController.text
                                                    .toString(),
                                                _passwordController.text
                                                    .toString());

                                      }
                                    },
                                    btnText: 'NEXT',
                                    btnBackgroundColor: context
                                        .watch<HospitalSignUpProvider>()
                                        .isButtonEnabled
                                        ? primaryAppColor
                                        : accentColor,
                                    btnTextColor: Colors.white)),
                          ),
                          SizedBox(
                            height: 30.h,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }
}
