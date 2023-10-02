import 'package:flutter/material.dart';
import 'package:immune_africa/providers/providers.dart';
import 'package:immune_africa/screens/screens.dart';
import 'package:provider/provider.dart';

import '../Widgets/widgets.dart';
import '../themes/themes.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});


  final _firstNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpProvider>(
      create: (_) => SignUpProvider(),
      builder: (context, child) => Scaffold(
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
                    'Login',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 40,
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
                    obscureText: context.read<SignUpProvider>().visible ? false : true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(onPressed: () {
                        context.read<SignUpProvider>().changeVisibility();
                      },
                          icon: context.watch<SignUpProvider>().visible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
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
                            onPressed: () {},
                            btnText: 'LOGIN',
                            btnBackgroundColor: accentColor,
                            btnTextColor: Colors.white)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
