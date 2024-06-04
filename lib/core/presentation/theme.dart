import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get darkTheme => ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: AppColors.bg,
      primaryColor: AppColors.primary,
      textTheme: GoogleFonts.robotoFlexTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bg,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyle.s19w700.copyWith(color: AppColors.black),
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.symmetric(vertical: 8),
          textStyle: AppTextStyle.s14w700,
          backgroundColor: AppColors.primary,
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 40),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.symmetric(vertical: 8),
          textStyle: AppTextStyle.s14w700,
          side: const BorderSide(color: AppColors.primary),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8),
          textStyle: AppTextStyle.s14w700.copyWith(color: AppColors.primary),
        ),
      ),
    );

abstract final class AppColors {
  static const primary = Color.fromRGBO(157, 98, 236, 1);

  static const red = Color.fromRGBO(255, 69, 58, 1);
  static const pink = Color.fromRGBO(240, 100, 142, 1);

  static const white = Color.fromRGBO(254, 254, 254, 1);
  static const grey = Color.fromRGBO(150, 153, 154, 1);
  static const greyContainer = Color.fromRGBO(232, 232, 236, 1);

  static const bg = Color.fromRGBO(249, 246, 255, 1);
  static const black = Color.fromRGBO(32, 32, 35, 1);
}

abstract final class AppTextStyle {
  static const s24w400 = TextStyle(fontSize: 24, fontWeight: FontWeight.w400, height: 1.2);
  static const s19w700 = TextStyle(fontSize: 19, fontWeight: FontWeight.w700, height: 1.2);
  static const s17w700 = TextStyle(fontSize: 17, fontWeight: FontWeight.w700, height: 1.2);
  static const s15w500 = TextStyle(fontSize: 15, fontWeight: FontWeight.w500, height: 1.25);
  static const s14w700 = TextStyle(fontSize: 14, fontWeight: FontWeight.w700, height: 1.5);
  static const s14w400 = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.36);
  static const s13w400 = TextStyle(fontSize: 13, fontWeight: FontWeight.w400, height: 1.5);
  static const s12w600 = TextStyle(fontSize: 12, fontWeight: FontWeight.w600, height: 1.33);
  static const s11w400 = TextStyle(fontSize: 11, fontWeight: FontWeight.w400, height: 1.33);
}
