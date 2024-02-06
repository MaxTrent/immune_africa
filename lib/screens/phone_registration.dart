import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:immune_africa/screens/screens.dart';
import 'package:immune_africa/themes/app_themes.dart';

import '../Widgets/widgets.dart';


extension ExtensionString on String{
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
          padding: EdgeInsets.symmetric(vertical: 30.0.h),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: 50.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppProgressIndicator(isFilled: true,),
                        AppProgressIndicator(isFilled: true),
                        AppProgressIndicator(isFilled: true),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'What is your phone\nnumber?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'We’ll send you text messages and notifications through your number',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.black, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    SizedBox(
                      height: 56.h,
                      width: 328.w,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(0, 5),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: TextFormField(
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
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              prefixIcon: SizedBox(
                                width: 75.w,
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
                                    Padding(
                                      padding: EdgeInsets.all(10.0.r),
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
                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                    height: 52.h,
                    width: 317.w,
                    child: AppButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RegisterSuccess(callback: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignIn()));  },)));
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
