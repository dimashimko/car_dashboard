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
  });

  @override
  final Color scaffoldBackgroundColor;
}

/// Create themes manually
final lightCustomThemeExtension = CustomThemeExtension(
  // scaffoldBackgroundColor: AppColors.white,
  scaffoldBackgroundColor: AppColors.gray.white,
);
final darkCustomThemeExtension = CustomThemeExtension(
  scaffoldBackgroundColor: AppColors.primary.dark1,
);
