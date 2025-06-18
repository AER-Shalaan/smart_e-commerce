import 'package:flutter/material.dart';
import 'package:smart_ecommerce/core/utils/app_colors.dart';
import 'package:smart_ecommerce/core/utils/styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backGroundColor,
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: Colors.white,
        error: AppColors.error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black87,
        onError: Colors.white,
      ),

      // Text Styles
      textTheme: TextTheme(
        headlineLarge: Styles.header1Semibold,
        headlineMedium: Styles.header2Semibold,
        headlineSmall: Styles.header3Semibold,
        titleLarge: Styles.header4Semibold,
        titleMedium: Styles.header4Medium,
        bodyLarge: Styles.body1Regular,
        bodyMedium: Styles.body2Regular,
        bodySmall: Styles.body3Regular,
        labelLarge: Styles.body1Medium,
        labelMedium: Styles.body2Medium,
        labelSmall: Styles.body3Medium,
      ),

      // AppBar theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white, size: 24),
        titleTextStyle: Styles.header2Semibold.copyWith(color: Colors.white),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),

      // Floating Action Button
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 6,
        hoverElevation: 8,
      ),

      // Bottom Navigation Bar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.secondary,
        unselectedItemColor: AppColors.secondary.withAlpha(120),
        selectedLabelStyle: Styles.body2Semibold.copyWith(
          color: AppColors.secondary,
        ),
        unselectedLabelStyle: Styles.body2Medium.copyWith(
          color: AppColors.secondary.withAlpha(120),
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),

      // Input decoration (TextField style)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary.withAlpha(51)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary.withAlpha(51)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        hintStyle: Styles.body2Regular.copyWith(color: Colors.grey.shade500),
        labelStyle: Styles.body2Medium.copyWith(color: AppColors.secondary),
        errorStyle: TextStyle(color: AppColors.error),
      ),

      // Icon theme globally
      iconTheme: const IconThemeData(color: AppColors.primary, size: 26),

      dividerColor: Colors.grey.shade300,

      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      primaryColor: AppColors.darkPrimary,
      colorScheme: ColorScheme.dark(
        primary: AppColors.darkPrimary,
        secondary: AppColors.darkSecondary,
        surface: const Color(0xFF1E1E1E),
        error: AppColors.darkError,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white70,
        onError: Colors.white,
      ),

      // Text Styles for dark mode
      textTheme: TextTheme(
        headlineLarge: Styles.header1Semibold.copyWith(color: Colors.white),
        headlineMedium: Styles.header2Semibold.copyWith(color: Colors.white),
        headlineSmall: Styles.header3Semibold.copyWith(color: Colors.white),
        titleLarge: Styles.header4Semibold.copyWith(color: Colors.white),
        titleMedium: Styles.header4Medium.copyWith(color: Colors.white70),
        bodyLarge: Styles.body1Regular.copyWith(color: Colors.white70),
        bodyMedium: Styles.body2Regular.copyWith(color: Colors.white70),
        bodySmall: Styles.body3Regular.copyWith(color: Colors.white60),
        labelLarge: Styles.body1Medium.copyWith(color: Colors.white70),
        labelMedium: Styles.body2Medium.copyWith(color: Colors.white70),
        labelSmall: Styles.body3Medium.copyWith(color: Colors.white60),
      ),

      // AppBar theme for dark mode
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkPrimary,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white, size: 24),
        titleTextStyle: Styles.header3Semibold.copyWith(
          color: Colors.white,
          fontSize: 20,
        ),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.darkPrimary,
        foregroundColor: Colors.white,
        elevation: 6,
        hoverElevation: 8,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xFF121212),
        selectedItemColor: AppColors.darkSecondary,
        unselectedItemColor: Colors.white.withAlpha(180),
        selectedLabelStyle: Styles.body2Semibold.copyWith(
          color: AppColors.darkSecondary,
        ),
        unselectedLabelStyle: Styles.body2Medium.copyWith(
          color: Colors.white.withAlpha(180),
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.darkPrimary.withAlpha(51)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.darkPrimary.withAlpha(51)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.darkPrimary, width: 2),
        ),
        hintStyle: Styles.body2Regular.copyWith(color: Colors.grey.shade400),
        labelStyle: Styles.body2Medium.copyWith(color: Colors.white70),
        errorStyle: TextStyle(color: AppColors.darkError),
      ),

      iconTheme: const IconThemeData(color: AppColors.darkSecondary, size: 26),

      dividerColor: Colors.grey.shade700,

      useMaterial3: true,
    );
  }
}
