import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:immune_africa/screens/screens.dart';
import 'package:immune_africa/themes/app_themes.dart';

import '../Widgets/widgets.dart';

class PhoneRegistration extends StatefulWidget {
  const PhoneRegistration({super.key});

  @override
  State<PhoneRegistration> createState() => _PhoneRegistrationState();
}

class _PhoneRegistrationState extends State<PhoneRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'What is your phone\nnumber?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.black),
                  ),
                  Text(
                    'We’ll send you text messages and notifications through your number',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.black, fontSize: 18),
                  ),
                  SizedBox(
                    height: 56,
                    width: 328,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Omoooo',
                          fillColor: Colors.white,
                          prefix: Row(
                            children: [
                              Text(
                                '+234',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(color: Colors.black),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: VerticalDivider(
                                  color: Colors.black,
                                  width: 25,
                                  thickness: 1,
                                ),
                              )
                            ],
                          ),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),

              SizedBox(
                  height: 52,
                  width: 317,
                  child: AppButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterSuccess()));
                      },
                      btnText: 'DONE',
                      btnBackgroundColor: primaryAppColor,
                      btnTextColor: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}
