import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CHOOSE YOUR LANGUAGE',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.black),
                ),
                Text('Which language are you\ncomfortable with?', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black),),
                const SizedBox(height: 40,),
                GestureDetector(
                    onTap: (){

                    },
                    child: TileSelect(isLanguageSelected: isLanguageSelected, text: 'Hello! I speak English',)),
                const SizedBox(height: 20,),
                TileSelect(isLanguageSelected: isLanguageSelected, text: 'bonjour je parle francais',),
                const SizedBox(height: 20,),
                TileSelect(isLanguageSelected: isLanguageSelected, text: 'hallo ek praat frans',),
                const SizedBox(height: 20,),
                TileSelect(isLanguageSelected: isLanguageSelected, text: 'habari nazungumza kifaransa',),
                const SizedBox(height: 70,),
                SizedBox(
                    height: 52,
                    width: 317,
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
      height: 54,
      width: 317,
      decoration: BoxDecoration(
        color: primaryAppColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(width: 20,),
         isLanguageSelected ? Image.asset('assets/tick.png') : Container(),
        ],
      )),
    );
  }
}
