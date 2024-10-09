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

  @override
  CustomThemeExtension copyWith({
    Color? scaffoldBackgroundColor,
  }) {
    return CustomThemeExtension(
      scaffoldBackgroundColor:
          scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
    );
  }

  @override
  CustomThemeExtension lerp(
      covariant ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this as CustomThemeExtension;
    return CustomThemeExtension(
      scaffoldBackgroundColor: Color.lerp(
          scaffoldBackgroundColor, other.scaffoldBackgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomThemeExtension &&
            const DeepCollectionEquality().equals(
                scaffoldBackgroundColor, other.scaffoldBackgroundColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(scaffoldBackgroundColor),
    );
  }
}

extension CustomThemeExtensionBuildContextProps on BuildContext {
  CustomThemeExtension get customThemeExtension =>
      Theme.of(this).extension<CustomThemeExtension>()!;
  Color get scaffoldBackgroundColor =>
      customThemeExtension.scaffoldBackgroundColor;
}
