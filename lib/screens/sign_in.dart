import 'package:flutter/material.dart';
import 'package:immune_africa/providers/providers.dart';
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
                    showCursor: true,
                    cursorColor: accentColor,
                    onChanged: (value1) {
                      if(value1.isNotEmpty){
                        context.read<SignInProvider>().changeButtonStatusTrue();
                      }
                      else{
                      context.read<SignInProvider>().changeButtonStatusFalse();
                      }

                    },
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailController,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: accentColor,
                        ),
                      ),
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
                    enableInteractiveSelection: false,
                    showCursor: true,
                    cursorColor: accentColor,

                    onChanged: (value2) {
                      if(value2.isNotEmpty){
                        context.read<SignInProvider>().changeButtonStatusTrue();
                      }
                      else{
                        context.read<SignInProvider>().changeButtonStatusFalse();
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
                              ? const Icon(Icons.visibility, color: Colors.black,)
                              : const Icon(Icons.visibility_off, color: accentColor,)),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: accentColor,
                        ),
                      ),
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
                    child: context.watch<SignInProvider>().isLoading ? const SizedBox(
                      height: 30,
                      width: 35,
                      child: CircularProgressIndicator(
                        color: primaryAppColor,
                        strokeWidth: 2,
                      ),
                    ): SizedBox(
                        height: 52,
                        width: 317,
                        child: AppButton(
                          onPressed: (){
                            if (_formKey.currentState!.validate()) {
                              context.read<SignInProvider>().signIn(context, _emailController.text.toString(), _passwordController.text.toString());
                            }
                          },
                            // onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Dashboard()));},
                            btnText: 'LOGIN',
                            btnBackgroundColor: context.watch<SignInProvider>().isButtonEnabled ? primaryAppColor : accentColor,
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
