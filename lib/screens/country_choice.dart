import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:immune_africa/Widgets/progress_indicator.dart';
import 'screens.dart';
import 'package:immune_africa/themes/app_themes.dart';

class CountryChoice extends StatefulWidget {
  const CountryChoice({super.key});

  @override
  State<CountryChoice> createState() => _CountryChoiceState();
}

class _CountryChoiceState extends State<CountryChoice> {
  String countryValue = '';
  bool isCountrySelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppProgressIndicator(isFilled: true),
                      AppProgressIndicator(isFilled: true),
                      AppProgressIndicator(isFilled: false),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Text(
                    'Which country do you\ncurrently live in?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.black, fontSize: 24.sp),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Image.asset('assets/map.png'),
                  SizedBox(height: 70.h),
                  buildCountryPicker(context),
                  SizedBox(height: 40.h,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildCountryPicker(BuildContext context) {
    return SizedBox(
                height: 52.h,
                width: 317.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        enableFeedback: true,
                        elevation: 6,
                        // shadowColor: Colors.purple,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        )),
                    onPressed: () {
                      showCountryPicker(
                          context: context,
                          onSelect: (Country country) {
                            setState(() {
                              isCountrySelected = true;
                              countryValue = country.name;
                            });
                            print('Select country: ${country.displayName}');
                          },
                          countryListTheme: CountryListThemeData(
                            textStyle: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: Colors.black, fontSize: 18.sp),
                            flagSize: 0,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0.r),
                              topRight: Radius.circular(40.0.r),
                            ),
                            // Optional. Styles the search field.
                            inputDecoration: InputDecoration(
                              labelText: 'Search Country',
                              floatingLabelStyle: Theme.of(context).textTheme.headline1!.copyWith(color: primaryAppColor),
                              hintText: 'Start typing to search',
                              focusColor: primaryAppColor,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primaryAppColor,
                                  width: 3.w
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primaryAppColor,
                                ),
                              ),
                            ),
                          ));
                      Future.delayed(Duration(seconds: 2), (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PhoneRegistration()));
                      });
                      },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          !isCountrySelected ? 'Country' : countryValue,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: Colors.black),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: primaryAppColor,
                        )
                      ],
                    )),
              );
  }
}
