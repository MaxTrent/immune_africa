import 'package:flutter/material.dart';
import 'package:immune_africa/Widgets/widgets.dart';
import 'package:immune_africa/providers/providers.dart';
import 'package:immune_africa/screens/screens.dart';
import 'package:immune_africa/themes/app_themes.dart';
import 'package:provider/provider.dart';

class IndividualSignUp extends StatelessWidget {
  IndividualSignUp({super.key});

  final _firstNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IndividualSignUpProvider>(
        create: (_) => IndividualSignUpProvider(),
        builder: ((context, child) => Scaffold(
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
                          keyboardType: TextInputType.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _firstNameController,
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
                          'Email Address',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: Colors.black, fontSize: 18),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _emailController,
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
                          'Password',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: Colors.black, fontSize: 18),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _passwordController,
                          obscureText: context.read<IndividualSignUpProvider>().visible ? false : true,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(onPressed: () {
                              context.read<IndividualSignUpProvider>().changeVisibility();
                            },
                            icon: context.watch<IndividualSignUpProvider>().visible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
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
                        Text(
                          'Confirm Password',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: Colors.black, fontSize: 18),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: context.read<IndividualSignUpProvider>().visible ? false : true,
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(onPressed: () {
                              context.read<IndividualSignUpProvider>().changeVisibility();
                            },
                                icon: context.watch<IndividualSignUpProvider>().visible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: accentColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: SizedBox(
                              height: 52,
                              width: 317,
                              child: AppButton(
                                onPressed: (){
                                  context.read<IndividualSignUpProvider>().signUp(context, _emailController.text.toString(), _firstNameController.text.toString(), _passwordController.text.toString());
                                },
                                  // onPressed: () {
                                  //   Navigator.of(context).push(
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               const EmailVerification()));
                                  // },
                                  btnText: 'NEXT',
                                  btnBackgroundColor: accentColor,
                                  btnTextColor: Colors.white)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
