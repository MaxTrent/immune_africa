import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


  const primaryAppColor = Color(0xffA564D3);
  const accentColor = Color(0xffFFC9FF);
  const appGreen = Color(0xff62BC37);
  const appYellow = Color(0xffFBFF49);
  const appRed = Color(0xffd50101);
  // static const appAccentColor = Color(value)


class AppTheme{
  ThemeData get light => ThemeData(
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryAppColor,
    textTheme: TextTheme(
      displaySmall: GoogleFonts.montserrat(
        textStyle: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
        ),
      ),
      displayLarge: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
        )
      )

    )
  );
}