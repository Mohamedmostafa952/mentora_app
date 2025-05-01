import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentora_app/core/colors_manager.dart';

class ThemeManager {
  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.itim(
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
        color: ColorsManager.black,
      ),
      bodyLarge: GoogleFonts.itim(
        fontSize: 28.sp,
        fontWeight: FontWeight.normal,
        color: ColorsManager.black,
      ),
      titleMedium: GoogleFonts.itim(
        fontSize: 24.sp,
        fontWeight: FontWeight.normal,
        color: ColorsManager.blue,
      ),
      titleSmall: GoogleFonts.itim(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: ColorsManager.blue,
      ),
      bodySmall: GoogleFonts.itim(
        fontSize: 16.sp,
        color: ColorsManager.black.withOpacity(0.7),
        fontWeight: FontWeight.normal,
      ),
      labelLarge: GoogleFonts.itim(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white
      ),
      labelMedium: GoogleFonts.itim(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: ColorsManager.black
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.itim(
        fontSize: 16.sp,
        color: ColorsManager.black.withOpacity(0.7),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.r),
        borderSide: BorderSide(color: ColorsManager.black.withOpacity(0.4)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.r),
        borderSide: BorderSide(color: ColorsManager.black.withOpacity(0.4)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.r),
        borderSide: BorderSide(color: ColorsManager.black.withOpacity(0.4)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.r),
        borderSide: BorderSide(color: ColorsManager.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.r),
        borderSide: BorderSide(color: ColorsManager.red),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: ColorsManager.blue),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorsManager.white,
        backgroundColor: ColorsManager.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        textStyle: GoogleFonts.itim(fontSize: 20.sp),
      ),
    ),
  );
}
