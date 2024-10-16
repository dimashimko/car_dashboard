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
    required this.statisticsDivider,
    required this.statisticsTextLabel,
    required this.statisticsTextSecondary,
    required this.dateRangeSelectorBackground,
    required this.parametersTextColor,
    required this.inactive,
    required this.scaffoldBackgroundColor,
    required this.background,
    required this.onBackground,
    required this.searchBackground,
    required this.textPrimary,
    required this.textSecondary,
    required this.textSecondarySelected,
  });

  @override
  final Color statisticsDivider;
  @override
  final Color statisticsTextLabel;
  @override
  final Color statisticsTextSecondary;
  @override
  final Color dateRangeSelectorBackground;
  @override
  final Color parametersTextColor;
  @override
  final Color inactive;
  @override
  final Color scaffoldBackgroundColor;
  @override
  final Color background;
  @override
  final Color onBackground;
  @override
  final Color searchBackground;
  @override
  final Color textPrimary;
  @override
  final Color textSecondary;
  @override
  final Color textSecondarySelected;
}

final lightCustomThemeExtension = CustomThemeExtension(
  statisticsDivider: AppColors.statisticsDividerLight,
  statisticsTextLabel: AppColors.gray.dark5,
  statisticsTextSecondary: AppColors.gray.dark2,
  dateRangeSelectorBackground: AppColors.lightSearchBackground,
  parametersTextColor: AppColors.primary.dark1,
  inactive: AppColors.lightArcBackground,
  scaffoldBackgroundColor: AppColors.grayF5,
  background: AppColors.gray.white,
  onBackground: AppColors.lightShadeBlueGray,
  searchBackground: AppColors.lightSearchBackground,
  textPrimary: AppColors.gray.dark,
  textSecondary: AppColors.gray.dark2,
  textSecondarySelected: AppColors.gray.dark2,
);
final darkCustomThemeExtension = CustomThemeExtension(
  statisticsDivider: AppColors.statisticsDividerDark,
  statisticsTextLabel: AppColors.gray.dark4,
  statisticsTextSecondary: AppColors.darkTextStatistic,
  dateRangeSelectorBackground: AppColors.dateRangeSelectorBackgroundDark,
  parametersTextColor: AppColors.gray.white,
  inactive: AppColors.gray.dark,
  scaffoldBackgroundColor: AppColors.gray.dark,
  background: AppColors.primary.dark1,
  onBackground: AppColors.darkShadeBlueGray,
  searchBackground: AppColors.gray.dark,
  textPrimary: AppColors.gray.white,
  textSecondary: AppColors.gray.dark5,
  textSecondarySelected: AppColors.gray.white,
);