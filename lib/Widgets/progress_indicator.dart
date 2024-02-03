import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../themes/themes.dart';

class AppProgressIndicator extends StatelessWidget {
  AppProgressIndicator({
    Key? key, required this.isFilled
  }) : super(key: key);

  bool isFilled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      width: 81.w,
      decoration: BoxDecoration(
          color: isFilled ? primaryAppColor : Color(0xffFFC9FF),
          borderRadius: BorderRadius.circular(15.r)
      ),
    );
  }
}