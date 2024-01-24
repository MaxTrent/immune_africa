import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:immune_africa/Widgets/widgets.dart';
import 'package:immune_africa/providers/providers.dart';
import 'package:immune_africa/themes/themes.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddRecord extends StatelessWidget {
  AddRecord({super.key});

  final _controller = PageController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dateController = TextEditingController();
  final _relationshipController = TextEditingController();
  final _countryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  String gender = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddRecordProvider>(
      create: (_) => AddRecordProvider(),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: PageView(
            controller: _controller,
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Text(
                          'NEW RECORD',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 300,
                          width: 352,
                          child: Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30))),
                            elevation: 15,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  TextFormField(
                                    cursorColor: primaryAppColor,
                                    keyboardType: TextInputType.name,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: _firstNameController,
                                    decoration: InputDecoration(
                                      label: const Text('First Name'),
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .headline1!
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
                                    cursorColor: primaryAppColor,
                                    keyboardType: TextInputType.name,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: _lastNameController,
                                    decoration: InputDecoration(
                                      label: const Text('Last Name'),
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .headline1!
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
                                          .headline1!
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                              splashFactory:
                                                  NoSplash.splashFactory,
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
                                                      : const Color(
                                                          0xff3E3E3E66),
                                                ),
                                                Text(
                                                  'Male',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline1!
                                                      .copyWith(
                                                        color: context
                                                                    .watch<
                                                                        AddRecordProvider>()
                                                                    .selectedGender ==
                                                                1
                                                            ? primaryAppColor
                                                            : const Color(
                                                                0xff3E3E3E66),
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
                                              height: 60,
                                              width: 2,
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
                                                splashFactory:
                                                    NoSplash.splashFactory,
                                              ),
                                              child: Column(
                                                children: [
                                                  Icon(
                                                    Icons.female,
                                                    size: 60,
                                                    color: context
                                                                .watch<
                                                                    AddRecordProvider>()
                                                                .selectedGender ==
                                                            2
                                                        ? primaryAppColor
                                                        : const Color(
                                                            0xff3E3E3E66),
                                                  ),
                                                  Text(
                                                    'Female',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline1!
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
                        const SizedBox(
                          height: 70,
                        ),
                        SizedBox(
                            width: 317,
                            height: 52,
                            child: AppButton(
                                onPressed: () {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                btnText: 'Next',
                                btnBackgroundColor: primaryAppColor,
                                btnTextColor: Colors.white))
                      ],
                    ),
                  ),
                ),
              ),
              Form(
                key: _formKey2,
                child: Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Text(
                        'NEW RECORD',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 271,
                        width: 336,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          elevation: 15,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  cursorColor: primaryAppColor,
                                  keyboardType: TextInputType.name,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: _relationshipController,
                                  decoration: InputDecoration(
                                    label: const Text('Relationship to child'),
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .headline1!
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
                                  cursorColor: primaryAppColor,
                                  keyboardType: TextInputType.name,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: _countryController,
                                  decoration: InputDecoration(
                                    label: const Text('Country of Birth'),
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .headline1!
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
                      const SizedBox(
                        height: 70,
                      ),
                      SizedBox(
                          width: 317,
                          height: 52,
                          child: AppButton(
                              onPressed: () {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              btnText: 'Next',
                              btnBackgroundColor: primaryAppColor,
                              btnTextColor: Colors.white))
                    ],
                  ),
                ),
              ),
              Form(
                child: Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Upload Photo',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(color: Colors.black),
                            ),
                            TextButton(
                                onPressed: () {
                                  context
                                      .read<AddRecordProvider>()
                                      .addRecordToDB(context,
                                          _firstNameController.text,
                                          _lastNameController.text,
                                          _dateController.text,
                                          gender,
                                          _relationshipController.text,
                                          _countryController.text, context.read<AddRecordProvider>().downloadUrl);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Skip',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(color: Colors.black),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 271,
                        width: 336,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          elevation: 15,
                          child: Padding(
                            padding: const EdgeInsets.all(70),
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<AddRecordProvider>()
                                    .showOptions(context);
                              },
                              child: context.watch<AddRecordProvider>().isUploading ? Padding(
                                padding: const EdgeInsets.symmetric(vertical: 60.0),
                                child: LinearProgressIndicator(
                                  value: context.watch<AddRecordProvider>().uploadProgress,
                                  color: primaryAppColor,
                                  backgroundColor: Colors.grey[200],
                                  minHeight: 10,

                                ),
                              ): DottedBorder(
                                color: Colors.black,
                                radius: const Radius.circular(20),
                                dashPattern: const [5, 5],
                                strokeWidth: 2,
                                child: Center(
                                  child: Container(
                                    height: 120,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 50,
                                      color: primaryAppColor,
                                    ),
                                  ),
                                ),
                              ),

                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      SizedBox(
                          width: 317,
                          height: 52,
                          child: AppButton(
                              onPressed: () {
                                context.read<AddRecordProvider>().addRecordToDB(context, _firstNameController.text, _lastNameController.text, _dateController.text, gender, _relationshipController.text, _countryController.text, context.read<AddRecordProvider>().downloadUrl);
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
            ],
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
