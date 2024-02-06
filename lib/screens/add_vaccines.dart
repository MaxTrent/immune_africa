import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Widgets/widgets.dart';
import '../themes/themes.dart';

class AddVaccines extends StatelessWidget {
  AddVaccines({super.key});

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dateController = TextEditingController();
  final _sexController = TextEditingController();
  final _relationshipController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/baby2.png'),
                          radius: 30.r,
                        ),
                        Text(
                          'Chloe Adams',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: Colors.black, fontSize: 18.sp),
                        ),
                        Text(
                          '1 week old',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: Colors.black, fontSize: 16.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Form(
                          child: Center(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30.h,
                                ),
                                SizedBox(
                                  height: 500.h,
                                  width: 352.w,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.r),
                                            bottomRight: Radius.circular(30.r))),
                                    elevation: 15,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextFormField(
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  30),
                                              FilteringTextInputFormatter.allow(
                                                RegExp(r"[a-zA-Z]+|\s"),
                                              )
                                            ],
                                            keyboardType: TextInputType.name,
                                            validator: (val) {
                                              if (val!.length < 3 ||
                                                  val.isEmpty) {
                                                return 'Enter a valid First name';
                                              }
                                            },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            cursorColor: primaryAppColor,
                                            controller: _firstNameController,
                                            decoration: InputDecoration(
                                              label: Text('First Name'),
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(color: Colors.black),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: (Colors.red[200])!,
                                                ),
                                              ),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: accentColor,
                                                ),
                                              ),
                                              focusedBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: primaryAppColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.name,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: TextEditingController(),
                                            decoration: InputDecoration(
                                              label: Text('Last Name'),
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(color: Colors.black),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: primaryAppColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.name,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: TextEditingController(),
                                            decoration: InputDecoration(
                                              label: Text('Date of Birth'),
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(color: Colors.black),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: primaryAppColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.name,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: TextEditingController(),
                                            decoration: InputDecoration(
                                              labelText: 'Sex',
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(color: Colors.black),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: primaryAppColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.name,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: TextEditingController(),
                                            decoration: InputDecoration(
                                              labelText: 'Relationship',
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(color: Colors.black),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: primaryAppColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.name,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: TextEditingController(),
                                            decoration: InputDecoration(
                                              labelText: 'Country of Birth',
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(color: Colors.black),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: primaryAppColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 70.h,
                                ),
                                // SizedBox(
                                //     width: 317,
                                //     height: 52,
                                //     child: AppButton(onPressed: () {
                                //       _controller.nextPage(duration: const Duration(
                                //           milliseconds: 500),
                                //         curve: Curves.ease,);
                                //     },
                                //         btnText: 'Next',
                                //         btnBackgroundColor: primaryAppColor,
                                //         btnTextColor: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Form(
                          child: Center(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30.h,
                                ),
                                SizedBox(
                                  height: 423.h,
                                  width: 336.w,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.r),
                                            bottomRight: Radius.circular(30.r))),
                                    elevation: 15,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextFormField(
                                            keyboardType: TextInputType.name,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: TextEditingController(),
                                            decoration: InputDecoration(
                                              labelText: 'First Name',
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(color: Colors.black),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: primaryAppColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.name,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: TextEditingController(),
                                            decoration: InputDecoration(
                                              labelText: 'Last Name',
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(color: Colors.black),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: primaryAppColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.name,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: TextEditingController(),
                                            decoration: InputDecoration(
                                              labelText: 'Date of Birth',
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(color: Colors.black),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: primaryAppColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.name,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: TextEditingController(),
                                            decoration: InputDecoration(
                                              labelText: 'Sex',
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(color: Colors.black),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: primaryAppColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.name,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: TextEditingController(),
                                            decoration: InputDecoration(
                                              labelText: 'Relationship',
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(color: Colors.black),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: primaryAppColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.name,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: TextEditingController(),
                                            decoration: InputDecoration(
                                              label:
                                                  const Text('Country of Birth'),
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(color: Colors.black),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: primaryAppColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 70.h,
                                ),
                                // SizedBox(
                                //     width: 317,
                                //     height: 52,
                                //     child: AppButton(onPressed: () {
                                //       _controller.nextPage(duration: const Duration(
                                //           milliseconds: 500),
                                //         curve: Curves.ease,);
                                //     },
                                //         btnText: 'Next',
                                //         btnBackgroundColor: primaryAppColor,
                                //         btnTextColor: Colors.white))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
