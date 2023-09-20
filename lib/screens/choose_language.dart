import 'package:flutter/material.dart';
import 'package:immune_africa/themes/appThemes.dart';

class ChooseLanguage extends StatelessWidget {
  ChooseLanguage({super.key});

  bool isLanguageSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            const Text('Which language are you comfortable with?'),
            TileSelect(isLanguageSelected: isLanguageSelected, text: 'Hello! I speak English',)
          ],
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
          SizedBox(width: 20,),
         isLanguageSelected ? Image.asset('assets/tick.png') : Container(),
        ],
      )),
    );
  }
}
