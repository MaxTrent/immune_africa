import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors{
  static const primaryAppColor = Color(0xffC879FF);
  // static const appAccentColor = Color(value)
}

class AppTheme{
  ThemeData get light => ThemeData(
    primaryColor: AppColors.primaryAppColor,
    textTheme: TextTheme(
      headline1: GoogleFonts.montserrat(
        textStyle: const TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16,
        ),
      ),
      headline2: GoogleFonts.montserrat(
        textStyle: const TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        )
      )

    )
  );
}