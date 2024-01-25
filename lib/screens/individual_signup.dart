import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:immune_africa/Widgets/widgets.dart';
import 'package:immune_africa/providers/providers.dart';
import 'package:immune_africa/screens/screens.dart';
import 'package:immune_africa/themes/app_themes.dart';
import 'package:provider/provider.dart';

extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+[a-zA-Z]+[a-zA-Z]");
    return emailRegExp.hasMatch(this);
  }
}

class IndividualSignUp extends StatelessWidget {
  IndividualSignUp({super.key});

  final _firstNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? password;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IndividualSignUpProvider>(
        create: (_) => IndividualSignUpProvider(),
        builder: ((context, child) => WillPopScope(
          onWillPop: () async {
            return !context.read<IndividualSignUpProvider>().isLoading;
          },
          child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Form(
                      key: _formKey,
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
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppProgressIndicator(isFilled: true),
                              AppProgressIndicator(isFilled: false),
                              AppProgressIndicator(isFilled: false)
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'First Name',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: Colors.black, fontSize: 18),
                          ),
                          TextFormField(

                            inputFormatters: [
                              LengthLimitingTextInputFormatter(30),
                              FilteringTextInputFormatter.allow(
                                RegExp(r"[a-zA-Z]+|\s"),
                              )
                            ],
                            validator: (val) {
                              if (val!.length < 3 || val.isEmpty) {
                                return 'Enter a valid First name';
                              }
                            },
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                context
                                    .read<IndividualSignUpProvider>()
                                    .changeButtonStatusTrue();
                              } else {
                                context
                                    .read<IndividualSignUpProvider>()
                                    .changeButtonStatusFalse();
                              }
                            },
                            cursorColor: primaryAppColor,
                            keyboardType: TextInputType.name,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: (Colors.red[200])!,
                                ),
                              ),
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
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Email Address',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: Colors.black, fontSize: 18),
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
                                    .read<IndividualSignUpProvider>()
                                    .changeButtonStatusTrue();
                              } else {
                                context
                                    .read<IndividualSignUpProvider>()
                                    .changeButtonStatusFalse();
                              }
                            },
                            cursorColor: primaryAppColor,
                            keyboardType: TextInputType.name,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: _emailController,
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
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Password',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: Colors.black, fontSize: 18),
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
                                    .read<IndividualSignUpProvider>()
                                    .changeButtonStatusTrue();
                              } else {
                                context
                                    .read<IndividualSignUpProvider>()
                                    .changeButtonStatusFalse();
                              }
                            },
                            cursorColor: primaryAppColor,
                            keyboardType: TextInputType.name,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: _passwordController,
                            obscureText: context
                                    .read<IndividualSignUpProvider>()
                                    .isPasswordVisible
                                ? false
                                : true,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    context
                                        .read<IndividualSignUpProvider>()
                                        .changeVisibilityPassword();
                                  },
                                  icon: context
                                          .watch<IndividualSignUpProvider>()
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
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Confirm Password',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: Colors.black, fontSize: 18),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val != password) {
                                return 'Passwords are different. try again';
                              }
                              if (val!.isEmpty || val.length < 6) {
                                return 'Password has to be atleast 6 characters long. try again';
                              }
                            },
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                context
                                    .read<IndividualSignUpProvider>()
                                    .changeButtonStatusTrue();
                              } else {
                                context
                                    .read<IndividualSignUpProvider>()
                                    .changeButtonStatusFalse();
                              }
                            },
                            cursorColor: primaryAppColor,
                            keyboardType: TextInputType.name,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            obscureText: context
                                    .read<IndividualSignUpProvider>()
                                    .isConfirmPasswordVisible
                                ? false
                                : true,
                            controller: _confirmPasswordController,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    context
                                        .read<IndividualSignUpProvider>()
                                        .changeVisibilityConfirm();
                                  },
                                  icon: context
                                          .watch<IndividualSignUpProvider>()
                                          .isConfirmPasswordVisible
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
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: context
                                    .watch<IndividualSignUpProvider>()
                                    .isLoading
                                ? const SizedBox(
                                    height: 30,
                                    width: 35,
                                    child: CircularProgressIndicator(
                                      color: primaryAppColor,
                                      // strokeWidth: 2,
                                    ),
                                  )
                                : SizedBox(
                                    height: 52,
                                    width: 317,
                                    child: AppButton(
                                        onPressed: () {
                                          if (_formKey.currentState!.validate()) {
                                            context
                                                .read<IndividualSignUpProvider>()
                                                .signUp(
                                                    context,
                                                    _emailController.text
                                                        .toString(),
                                                    _firstNameController.text
                                                        .toString(),
                                                    _passwordController.text
                                                        .toString());
                                          }
                                        },
                                        // onPressed: () {
                                        //   Navigator.of(context).push(
                                        //       MaterialPageRoute(
                                        //           builder: (context) =>
                                        //               const EmailVerification()));
                                        // },
                                        btnText: 'NEXT',
                                        btnBackgroundColor: context
                                                .watch<IndividualSignUpProvider>()
                                                .isButtonEnabled
                                            ? primaryAppColor
                                            : accentColor,
                                        btnTextColor: Colors.white)),
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
