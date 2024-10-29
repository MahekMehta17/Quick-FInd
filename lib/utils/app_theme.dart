import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.primaryColor,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.scaffoldColor,

    /// Cursor color
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.textFieldBorderColor,
      selectionColor: AppColors.primaryColor,
      selectionHandleColor: AppColors.primaryColor,
    ),
    // Dropdown theme
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 8)),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(side: BorderSide(color: AppColors.textFieldBorderColor), borderRadius: BorderRadius.circular(8))),
        side: WidgetStateProperty.all(BorderSide(color: AppColors.textFieldBorderColor)),
      ),
    ),

    /// Elevated Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith<TextStyle?>(
          (Set<WidgetState> states) {
            return const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
          },
        ),
        elevation: WidgetStateProperty.all(0.2),
        foregroundColor: WidgetStateProperty.all<Color>(AppColors.white),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return AppColors.primaryColor;
            } else if (states.contains(WidgetState.disabled)) {
              return AppColors.grey;
            }
            return AppColors.primaryColor;
          },
        ),
      ),
    ),

    /// TextBox theme
    inputDecorationTheme: InputDecorationTheme(
      // hintStyle: AppTextStyle.montserrat14W500Grey,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(4),
      ),
      activeIndicatorBorder: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      outlineBorder: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    ),

    /// Divider
    dividerTheme: const DividerThemeData(
      thickness: 1.5,
      color: CupertinoColors.systemGrey5,
    ),

    /// Floating action button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: AppColors.primaryColor,
      elevation: 2,
      iconSize: 36,
    ),

    /// Progress indicator theme
    progressIndicatorTheme: ProgressIndicatorThemeData(
      circularTrackColor: AppColors.primaryColor,
      color: AppColors.primaryColor,
      refreshBackgroundColor: AppColors.primaryColor,
    ),

    ///AppBar theme
    appBarTheme: AppBarTheme(
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.white),
        titleTextStyle: TextStyle(color: AppColors.white, fontSize: 20),
        surfaceTintColor: Colors.white,
        backgroundColor: AppColors.primaryColor

        /// In material3 , If we don't apple this , Appbar is getting transparent when scroll-up
        ),
  );
}
