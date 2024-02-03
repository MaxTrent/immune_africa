import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:immune_africa/providers/providers.dart';
import 'package:immune_africa/screens/individual_signup.dart';
import 'package:provider/provider.dart';
import '../Widgets/widgets.dart';
import '../themes/themes.dart';




class SignIn extends StatelessWidget {
  SignIn({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInProvider>(
      create: (_) => SignInProvider(),
      builder: (context, child) => WillPopScope(
        onWillPop: () async {
            return !context.read<SignInProvider>().isLoading;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'Email Address',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.black, fontSize: 18.sp),
                    ),
                    TextFormField(
                      validator: (value){
                        if(!value!.isValidEmail){
                          return 'Enter valid email address';
                        }
                      },
                      showCursor: true,
                      cursorColor: primaryAppColor,
                      onChanged: (value1) {
                        if (value1.isNotEmpty) {
                          context.read<SignInProvider>().changeButtonStatusTrue();
                        } else {
                          context
                              .read<SignInProvider>()
                              .changeButtonStatusFalse();
                        }
                      },
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _emailController,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryAppColor,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: accentColor,
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
                          .headline1!
                          .copyWith(color: Colors.black, fontSize: 18.sp),
                    ),
                    TextFormField(
                      enableInteractiveSelection: false,
                      showCursor: true,
                      cursorColor: primaryAppColor,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'Password must be at least 6  character';
                        }
                      },
                      onChanged: (value2) {
                        if (value2.isNotEmpty) {
                          context.read<SignInProvider>().changeButtonStatusTrue();
                        } else {
                          context
                              .read<SignInProvider>()
                              .changeButtonStatusFalse();
                        }
                      },
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _passwordController,
                      obscureText:
                          context.watch<SignInProvider>().visible ? false : true,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              context.read<SignInProvider>().changeVisibility();
                            },
                            icon: context.watch<SignInProvider>().visible
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: accentColor,
                                  )),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryAppColor,
                          ),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: accentColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Center(
                      child: context.watch<SignInProvider>().isLoading
                          ? SizedBox(
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
                                      context.read<SignInProvider>().signIn(
                                          context,
                                          _emailController.text.toString(),
                                          _passwordController.text.toString());
                                    }
                                  },
                                  // onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Dashboard()));},
                                  btnText: 'LOGIN',
                                  btnBackgroundColor: context
                                          .watch<SignInProvider>()
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
      ),
    );
  }
}
