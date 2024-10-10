// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'custom_theme_extension.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$CustomThemeExtensionTailorMixin
    on ThemeExtension<CustomThemeExtension> {
  Color get scaffoldBackgroundColor;
  Color get background;
  Color get onBackground;
  Color get searchBackground;
  Color get textPrimary;
  Color get textSecondary;
  Color get textSecondarySelected;

  @override
  CustomThemeExtension copyWith({
    Color? scaffoldBackgroundColor,
    Color? background,
    Color? onBackground,
    Color? searchBackground,
    Color? textPrimary,
    Color? textSecondary,
    Color? textSecondarySelected,
  }) {
    return CustomThemeExtension(
      scaffoldBackgroundColor:
          scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      searchBackground: searchBackground ?? this.searchBackground,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textSecondarySelected:
          textSecondarySelected ?? this.textSecondarySelected,
    );
  }

  @override
  CustomThemeExtension lerp(
      covariant ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this as CustomThemeExtension;
    return CustomThemeExtension(
      scaffoldBackgroundColor: Color.lerp(
          scaffoldBackgroundColor, other.scaffoldBackgroundColor, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      searchBackground:
          Color.lerp(searchBackground, other.searchBackground, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textSecondarySelected:
          Color.lerp(textSecondarySelected, other.textSecondarySelected, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomThemeExtension &&
            const DeepCollectionEquality().equals(
                scaffoldBackgroundColor, other.scaffoldBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(background, other.background) &&
            const DeepCollectionEquality()
                .equals(onBackground, other.onBackground) &&
            const DeepCollectionEquality()
                .equals(searchBackground, other.searchBackground) &&
            const DeepCollectionEquality()
                .equals(textPrimary, other.textPrimary) &&
            const DeepCollectionEquality()
                .equals(textSecondary, other.textSecondary) &&
            const DeepCollectionEquality()
                .equals(textSecondarySelected, other.textSecondarySelected));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(scaffoldBackgroundColor),
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(onBackground),
      const DeepCollectionEquality().hash(searchBackground),
      const DeepCollectionEquality().hash(textPrimary),
      const DeepCollectionEquality().hash(textSecondary),
      const DeepCollectionEquality().hash(textSecondarySelected),
    );
  }
}

extension CustomThemeExtensionBuildContextProps on BuildContext {
  CustomThemeExtension get customThemeExtension =>
      Theme.of(this).extension<CustomThemeExtension>()!;
  Color get scaffoldBackgroundColor =>
      customThemeExtension.scaffoldBackgroundColor;
  Color get background => customThemeExtension.background;
  Color get onBackground => customThemeExtension.onBackground;
  Color get searchBackground => customThemeExtension.searchBackground;
  Color get textPrimary => customThemeExtension.textPrimary;
  Color get textSecondary => customThemeExtension.textSecondary;
  Color get textSecondarySelected => customThemeExtension.textSecondarySelected;
}
