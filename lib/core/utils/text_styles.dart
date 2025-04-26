import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class TextStyles {
  static TextStyle headlineStyle = GoogleFonts.dmSans(
    fontWeight: FontWeight.w800,
    color: AppColors.secondary,
    fontSize: 32,
  );

  static TextStyle titleMediumStyle = GoogleFonts.dmSans(
    fontWeight: FontWeight.w500,
    color: AppColors.secondary,
    fontSize: 16,
  );
  static TextStyle filterBottomSheetTitles = GoogleFonts.dmSans(
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
    fontSize: 24,
  );

  static TextStyle listsTitle = GoogleFonts.dmSans(
    fontWeight: FontWeight.w500,
    color: AppColors.secondary,
    fontSize: 20,
  );

  static TextStyle accountLabels = GoogleFonts.dmSans(
    color: AppColors.secondary,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle myDetailsLabels = GoogleFonts.dmSans(
    color: AppColors.primary,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle myDetailsTexts = GoogleFonts.dmSans(
    color: AppColors.secondary.withOpacity(0.5),
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle fAQsLabels = GoogleFonts.dmSans(
    color: AppColors.primary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle fAQsTexts = GoogleFonts.dmSans(
    color: AppColors.secondary.withOpacity(0.5),
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle dialogTitleStyle = GoogleFonts.dmSans(
    fontWeight: FontWeight.bold,
    color: AppColors.secondary,
    fontSize: 20,
  );
  static TextStyle dialogMessageStyle = GoogleFonts.dmSans(
    fontWeight: FontWeight.w400,
    color: AppColors.secondary.withOpacity(0.4),
    fontSize: 16,
  );
  static TextStyle dialogLabelButtonStyle = GoogleFonts.dmSans(
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontSize: 16,
  );
}
