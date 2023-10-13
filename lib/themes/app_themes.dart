import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


  const primaryAppColor = Color(0xffA564D3);
  const accentColor = Color(0xffFFC9FF);
  // static const appAccentColor = Color(value)


class AppTheme{
  ThemeData get light => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryAppColor,
    textTheme: TextTheme(
      headline1: GoogleFonts.montserrat(
        textStyle: const TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 16,
        ),
      ),
      headline2: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        )
      )

    )
  );
}