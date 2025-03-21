import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:immune_africa/Widgets/widgets.dart';
import 'package:immune_africa/providers/providers.dart';
import 'package:immune_africa/themes/themes.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddRecord extends StatelessWidget {
  AddRecord({super.key});

  static final _controller = PageController();
  static final _firstNameController = TextEditingController();
  static final _lastNameController = TextEditingController();
  static final _dateController = TextEditingController();
  static final _relationshipController = TextEditingController();
  static final _countryController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();
  static final _formKey2 = GlobalKey<FormState>();
  String gender = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddRecordProvider>(
      create: (_) => AddRecordProvider(),
      builder: (context, child) => Scaffold(
        body: SafeArea(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            allowImplicitScrolling: false,
            controller: _controller,
            children: [
              _buildPage1(context),
              _buildPage2(context),
              _buildPage3(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage3(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upload Photo',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {
                          context.read<AddRecordProvider>().addRecordToDB(
                              context,
                              _firstNameController.text,
                              _lastNameController.text,
                              _dateController.text,
                              gender,
                              _relationshipController.text,
                              _countryController.text,
                              context.read<AddRecordProvider>().downloadUrl);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Skip',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: Colors.black),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 271.h,
                width: 336.w,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          bottomRight: Radius.circular(30.r))),
                  elevation: 15,
                  child: Padding(
                    padding: EdgeInsets.all(70.r),
                    child: GestureDetector(
                      onTap: () {
                        context.read<AddRecordProvider>().showOptions(context);
                      },
                      child: context.watch<AddRecordProvider>().isUploading
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 60.0.h),
                              child: LinearProgressIndicator(
                                value: context
                                    .watch<AddRecordProvider>()
                                    .uploadProgress,
                                color: primaryAppColor,
                                backgroundColor: Colors.grey[200],
                                minHeight: 10.h,
                              ),
                            )
                          : context.watch<AddRecordProvider>().isUploadComplete
                              ? Text('Upload Completed!')
                              : DottedBorder(
                                  color: Colors.black,
                                  radius: Radius.circular(20.r),
                                  dashPattern: const [5, 5],
                                  strokeWidth: 2,
                                  child: Center(
                                    child: Container(
                                      height: 120.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 50.r,
                                        color: primaryAppColor,
                                      ),
                                    ),
                                  ),
                                ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70.h,
              ),
              SizedBox(
                  width: 317.w,
                  height: 52.h,
                  child: AppButton(
                      onPressed: () {
                        context.read<AddRecordProvider>().addRecordToDB(
                            context,
                            _firstNameController.text,
                            _lastNameController.text,
                            _dateController.text,
                            gender,
                            _relationshipController.text,
                            _countryController.text,
                            context.read<AddRecordProvider>().downloadUrl);
                        Navigator.pop(context);
                      },
                      // onPressed: () {
                      //   _controller.nextPage(
                      //     duration: const Duration(milliseconds: 500),
                      //     curve: Curves.ease,
                      //   );
                      // },
                      btnText: 'Done',
                      btnBackgroundColor: primaryAppColor,
                      btnTextColor: Colors.white))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage2(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey2,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  'NEW RECORD',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 271.h,
                  width: 336.w,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            bottomRight: Radius.circular(30.r))),
                    elevation: 15,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(30),
                              FilteringTextInputFormatter.allow(
                                RegExp(r"[a-zA-Z]+|\s"),
                              )
                            ],
                            validator: (val){
                              if(val!.length <3 || val.isEmpty){
                                return 'Enter your relationship with child';
                              }
                            },
                            cursorColor: primaryAppColor,
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _relationshipController,
                            decoration: InputDecoration(
                              label: const Text('Relationship to child'),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: Colors.black),
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
                          TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(30),
                              FilteringTextInputFormatter.allow(
                                RegExp(r"[a-zA-Z]+|\s"),
                              )
                            ],
                            validator: (val){
                              if(val!.length <3 || val.isEmpty){
                                return 'Enter valid country';
                              }
                            },
                            cursorColor: primaryAppColor,
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _countryController,
                            decoration: InputDecoration(
                              label: const Text('Country of Birth'),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: Colors.black),
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
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
                Center(
                  child: SizedBox(
                      width: 317.w,
                      height: 52.h,
                      child: AppButton(
                          onPressed: () {
                            if(_formKey2.currentState!.validate()) {
                              _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                            }
                            else{
                              Fluttertoast.showToast(
                                  msg: 'Fill all fields',
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,);
                            }
                          },
                          btnText: 'Next',
                          btnBackgroundColor: primaryAppColor,
                          btnTextColor: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPage1(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  'NEW RECORD',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  // height: 300.h,
                  width: 352.w,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            bottomRight: Radius.circular(30.r))),
                    elevation: 15,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
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
                            cursorColor: primaryAppColor,
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              label: const Text('First Name'),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: Colors.black),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: accentColor,
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: primaryAppColor,
                              )),
                            ),
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
                            cursorColor: primaryAppColor,
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _lastNameController,
                            decoration: InputDecoration(
                              label: const Text('Last Name'),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: Colors.black),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: accentColor,
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: primaryAppColor,
                              )),
                            ),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Select a Date of Birth';
                              }
                            },
                            readOnly: true,
                            cursorColor: primaryAppColor,
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _dateController,
                            onTap: () {
                              buildShowDatePicker(context);
                            },
                            decoration: InputDecoration(
                              label: const Text('Date of Birth'),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: Colors.black),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: accentColor,
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: primaryAppColor,
                              )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      context
                                          .read<AddRecordProvider>()
                                          .selectMale();
                                      gender = 'Male';
                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide.none,
                                      splashFactory: NoSplash.splashFactory,
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.male,
                                          size: 60,
                                          color: context
                                                      .watch<
                                                          AddRecordProvider>()
                                                      .selectedGender ==
                                                  1
                                              ? primaryAppColor
                                              : const Color(0xff3E3E3E66),
                                        ),
                                        Text(
                                          'Male',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall!
                                              .copyWith(
                                                color: context
                                                            .watch<
                                                                AddRecordProvider>()
                                                            .selectedGender ==
                                                        1
                                                    ? primaryAppColor
                                                    : const Color(0xff3E3E3E66),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // GestureDetector(child: Icon(
                                  //   Icons.male, size: 60,
                                  //   color: context
                                  //       .watch<AddRecordProvider>()
                                  //       .selectedGender == 1
                                  //       ? primaryAppColor
                                  //       : Colors.black,),
                                  //   onTap: () {
                                  //     context.watch<
                                  //         AddRecordProvider>()
                                  //         .selectMale();
                                  //   },),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 60.h,
                                      width: 2.w,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffB66EE8)
                                            .withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                  OutlinedButton(
                                      onPressed: () {
                                        context
                                            .read<AddRecordProvider>()
                                            .selectFemale();
                                        gender = 'Female';
                                      },
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide.none,
                                        splashFactory: NoSplash.splashFactory,
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.female,
                                            size: 60.r,
                                            color: context
                                                        .watch<
                                                            AddRecordProvider>()
                                                        .selectedGender ==
                                                    2
                                                ? primaryAppColor
                                                : const Color(0xff3E3E3E66),
                                          ),
                                          Text(
                                            'Female',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall!
                                                .copyWith(
                                                    color: context
                                                                .watch<
                                                                    AddRecordProvider>()
                                                                .selectedGender ==
                                                            2
                                                        ? primaryAppColor
                                                        : const Color(
                                                            0xff3E3E3E66)),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
                Center(
                  child: SizedBox(
                      width: 317.w,
                      height: 52.h,
                      child: AppButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                gender.isNotEmpty) {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg: 'Fill and Select all fields',
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                              );
                            }
                          },
                          btnText: 'Next',
                          btnBackgroundColor: primaryAppColor,
                          btnTextColor: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildShowDatePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        lastDate: DateTime.now(),
        firstDate: DateTime(2000),
        initialDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: primaryAppColor,
                onPrimary: Colors.white,
                onSurface: primaryAppColor,
              ),
              // textButtonTheme: TextButtonThemeData(
              //   style: TextButton.styleFrom(
              //     // primary: primaryAppColor, // button text color
              //   ),
              // ),
            ),
            child: child!,
          );
        });

    if (pickedDate == null) return;
    _dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
  }
}
