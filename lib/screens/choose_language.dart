import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:immune_africa/Widgets/app_button.dart';
import 'package:immune_africa/screens/country_choice.dart';
import 'package:immune_africa/themes/app_themes.dart';

class ChooseLanguage extends StatelessWidget {
  ChooseLanguage({super.key});

  bool isLanguageSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CHOOSE YOUR LANGUAGE',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.black),
                ),
                Text('Which language are you\ncomfortable with?', style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black),),
                SizedBox(height: 40.h,),
                GestureDetector(
                    onTap: (){

                    },
                    child: TileSelect(isLanguageSelected: isLanguageSelected, text: 'Hello! I speak English',)),
                SizedBox(height: 20.h,),
                TileSelect(isLanguageSelected: isLanguageSelected, text: 'bonjour je parle francais',),
                SizedBox(height: 20.h,),
                TileSelect(isLanguageSelected: isLanguageSelected, text: 'hallo ek praat frans',),
                SizedBox(height: 20.h,),
                TileSelect(isLanguageSelected: isLanguageSelected, text: 'habari nazungumza kifaransa',),
                SizedBox(height: 70.h,),
                SizedBox(
                    height: 52.h,
                    width: 317.w,
                    child: AppButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CountryChoice()));}, btnText: 'NEXT', btnBackgroundColor: primaryAppColor, btnTextColor: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TileSelect extends StatelessWidget {
  TileSelect({
    Key? key,required this.text,
    required this.isLanguageSelected,
  }) : super(key: key);

  String text;
  final bool isLanguageSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      width: 317.w,
      decoration: BoxDecoration(
        color: primaryAppColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.white, fontSize: 18.sp),
          ), SizedBox(width: 20.w,),
         isLanguageSelected ? Image.asset('assets/tick.png') : Container(),
        ],
      )),
    );
  }
}
