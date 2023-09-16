import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {Key? key,
        required this.onPressed,
      required this.btnText,
      required this.btnBackgroundColor,
      required this.btnTextColor})
      : super(key: key);
  Color btnBackgroundColor;
  String btnText;
  Color btnTextColor;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: btnBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          btnText,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: btnTextColor),
        ));
  }
}
