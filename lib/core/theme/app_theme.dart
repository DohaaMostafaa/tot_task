import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light().copyWith(
      background: AppColors.lightGrey,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
      actionsPadding: EdgeInsets.all(5.w),
      actionsIconTheme: const IconThemeData(color: AppColors.black),
      iconTheme: const IconThemeData(color: Colors.black),
    ),

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primary.withOpacity(0.3),
      selectionHandleColor: AppColors.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: AppColors.primary, fontSize: 14),
      hintStyle: TextStyle(color: AppColors.grey, fontSize: 12.sp),
      hoverColor: AppColors.primary,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
    ),

    dividerColor: AppColors.dividerLight,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: AppColors.primary,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(color: AppColors.grey, fontSize: 12.sp),
      labelSmall: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),

    iconTheme: const IconThemeData(color: AppColors.textSecondaryLight),
    badgeTheme: BadgeThemeData(
      backgroundColor: AppColors.redColor,
      textColor: AppColors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.darkBackground,
      backgroundColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightSelectedItem,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,

    colorScheme: const ColorScheme.dark().copyWith(background: AppColors.grey),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
      actionsPadding: EdgeInsets.all(5.w),
      actionsIconTheme: const IconThemeData(color: AppColors.white),
      iconTheme: const IconThemeData(color: AppColors.white),
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: AppColors.black),
      hintStyle: TextStyle(color: AppColors.grey, fontSize: 12.sp),
      hoverColor: AppColors.black,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.black, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.black, width: 2),
      ),
    ),
    dividerColor: AppColors.dividerDark,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimaryDark, fontSize: 16.sp),
      bodyMedium: TextStyle(color: AppColors.white, fontSize: 14.sp),
      titleLarge: TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(color: AppColors.grey, fontSize: 12.sp),
      labelSmall: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.textSecondaryDark),
    badgeTheme: BadgeThemeData(
      backgroundColor: AppColors.redColor,
      textColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.white,
      backgroundColor: AppColors.darkBackground,
      type: BottomNavigationBarType.fixed,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
      ),
    ),
  );
}
