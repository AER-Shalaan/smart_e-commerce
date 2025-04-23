import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backGroundColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyles.headlineStyle,
      titleMedium: TextStyles.titleMediumStyle,
      bodyMedium: TextStyles.listsTitle,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: const TextStyle(color: AppColors.secondary),
      selectedItemColor: AppColors.secondary,
      unselectedLabelStyle: TextStyle(
        color: AppColors.secondary.withOpacity(0.3),
      ),
      enableFeedback: false,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
}
