import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '../app_colors.dart';

part 'custom_theme_extension.tailor.dart';

CustomThemeExtension colors(context) =>
    Theme.of(context).extension<CustomThemeExtension>()!;

@TailorMixin()
class CustomThemeExtension extends ThemeExtension<CustomThemeExtension>
    with _$CustomThemeExtensionTailorMixin {
  CustomThemeExtension({
    required this.scaffoldBackgroundColor,
    required this.background,
    required this.onBackground,
    required this.textPrimary,
    required this.textSecondary,
    required this.textSecondarySelected,
  });

  @override
  final Color scaffoldBackgroundColor;
  @override
  final Color background;
  @override
  final Color onBackground;
  @override
  final Color textPrimary;
  @override
  final Color textSecondary;
  @override
  final Color textSecondarySelected;
}

/// Create themes manually
final lightCustomThemeExtension = CustomThemeExtension(
  scaffoldBackgroundColor: AppColors.grayF5,
  background: AppColors.gray.white,
  onBackground: AppColors.lightShadeBlueGray,
  textPrimary: AppColors.gray.dark,
  textSecondary: AppColors.gray.dark2,
  textSecondarySelected: AppColors.gray.dark2,
);
final darkCustomThemeExtension = CustomThemeExtension(
  scaffoldBackgroundColor: AppColors.gray.dark,
  background: AppColors.primary.dark1,
  onBackground: AppColors.darkShadeBlueGray,
  textPrimary: AppColors.gray.white,
  textSecondary: AppColors.gray.dark5,
  textSecondarySelected: AppColors.gray.white,
);
