import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:immune_africa/screens/screens.dart';
import 'package:immune_africa/themes/app_themes.dart';

import '../Widgets/widgets.dart';


extension ExtString on String{
  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}

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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppProgressIndicator(isFilled: true,),
                        AppProgressIndicator(isFilled: true),
                        AppProgressIndicator(isFilled: true),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      'What is your phone\nnumber?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'We’ll send you text messages and notifications through your number',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.black, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 56,
                      width: 328,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(0, 5),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.allow(
                              RegExp(r"[0-9]"),
                            ),
                          ],
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
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
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
      ),
    );
  }
}

// class ProgressIndicator extends StatelessWidget {
//   ProgressIndicator({
//     Key? key, required this.isFilled
//   }) : super(key: key);
//
//   bool isFilled;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 4,
//       width: 81,
//       decoration: BoxDecoration(
//         color: isFilled ? primaryAppColor : Color(0xffFFC9FF),
//         borderRadius: BorderRadius.circular(15)
//       ),
//     );
//   }
// }
