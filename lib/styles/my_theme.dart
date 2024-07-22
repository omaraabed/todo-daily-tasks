import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.lightColor,
      primaryColor: AppColors.lightColor,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.lightColor,
          onPrimary: Colors.black54,
          secondary: Colors.grey.shade300,
          onSecondary: Colors.black54,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.transparent,
          onBackground: AppColors.lightColor,
          surface: Colors.white,
          onSurface: Colors.black54),
      appBarTheme: AppBarTheme(
          toolbarHeight: 90,
          backgroundColor: AppColors.blueColor,
          centerTitle: false,
          iconTheme: IconThemeData(size: 30, color: Colors.white)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.blueColor,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        bodyMedium: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.blueColor),
        bodySmall: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff383838)),
      ));
  static ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.darkColor,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.darkColor,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.transparent,
          onBackground: AppColors.darkColor,
          surface: AppColors.darkColor,
          onSurface: Colors.white),
      appBarTheme: AppBarTheme(
          toolbarHeight: 90,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          iconTheme: IconThemeData(size: 30)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.blueColor,
        unselectedItemColor: Colors.white,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.darkColor),
        bodyMedium: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.blueColor),
        bodySmall: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ));
}
