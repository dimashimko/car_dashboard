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
    required this.carWidgetBackground,
    required this.divider,
    required this.assetsGrayText,
    required this.notesCardIcon,
    required this.notesCardShadow,
    required this.textGray,
    required this.notesStatusBanner,
    required this.notesStatusBannerText,
    required this.dividerSensor,
    required this.assetsSensorColor,
    required this.bookingDropdown,
    required this.bookingIconColor,
    required this.bookingPassengerText,
    required this.sellCarsGridLine,
    required this.inactiveRed,
    required this.sellCarsTooltip,
    required this.sellCarsTooltipText,
    required this.averagePrice,
    required this.arcBackground,
    required this.offerParameters,
    required this.calendarDaysOfWeek,
    required this.calendarDays,
    required this.calendarToggleBackground,
    required this.stripeContainerBaseColor,
    required this.stripeContainerStripeColor,
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
  @override
  final Color carWidgetBackground;
  @override
  final Color divider;
  @override
  final Color assetsGrayText;
  @override
  final Color notesCardIcon;
  @override
  final Color notesCardShadow;
  @override
  final Color textGray;
  @override
  final Color notesStatusBanner;
  @override
  final Color notesStatusBannerText;
  @override
  final Color dividerSensor;
  @override
  final Color assetsSensorColor;
  @override
  final Color bookingDropdown;
  @override
  final Color bookingIconColor;
  @override
  final Color bookingPassengerText;
  @override
  final Color sellCarsGridLine;
  @override
  final Color inactiveRed;
  @override
  final Color sellCarsTooltip;
  @override
  final Color sellCarsTooltipText;
  @override
  final Color averagePrice;
  @override
  final Color arcBackground;
  @override
  final Color offerParameters;
  @override
  final Color calendarDaysOfWeek;
  @override
  final Color calendarDays;
  @override
  final Color calendarToggleBackground;
  @override
  final Color stripeContainerBaseColor;
  @override
  final Color stripeContainerStripeColor;
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
  carWidgetBackground: AppColors.carWidgetBackgroundLight,
  divider: AppColors.dividerLight,
  assetsGrayText: AppColors.gray.dark6,
  notesCardIcon: AppColors.white,
  notesCardShadow: AppColors.notesCardShadowLight,
  textGray: AppColors.gray.dark3,
  notesStatusBanner: AppColors.notesStatusBannerLight,
  notesStatusBannerText: AppColors.primary.dark1,
  dividerSensor: AppColors.grayF3,
  assetsSensorColor: AppColors.assetsSensorColorLight,
  bookingDropdown: AppColors.gray.dark2,
  bookingIconColor: AppColors.bookingIconColorLight,
  bookingPassengerText: AppColors.gray.dark3,
  sellCarsGridLine: AppColors.statisticsDividerLight,
  inactiveRed: AppColors.inactiveRedLight,
  sellCarsTooltip: AppColors.sellCarsTooltipLight,
  sellCarsTooltipText: AppColors.gray.white,
  averagePrice: AppColors.gray.dark6,
  arcBackground: AppColors.grayF3,
  offerParameters: AppColors.gray.dark5,
  calendarDaysOfWeek: AppColors.grayC3,
  calendarDays: AppColors.gray.dark2,
  calendarToggleBackground: AppColors.grayF9,
  stripeContainerBaseColor: AppColors.grayishWhite,
  stripeContainerStripeColor: AppColors.white,
);

final darkCustomThemeExtension = CustomThemeExtension(
  statisticsDivider: AppColors.statisticsDividerDark,
  statisticsTextLabel: AppColors.gray.dark4,
  statisticsTextSecondary: AppColors.darkTextStatistic,
  dateRangeSelectorBackground: AppColors.backgroundDark,
  parametersTextColor: AppColors.gray.white,
  inactive: AppColors.gray.dark,
  scaffoldBackgroundColor: AppColors.gray.dark,
  background: AppColors.primary.dark1,
  onBackground: AppColors.darkShadeBlueGray,
  searchBackground: AppColors.gray.dark,
  textPrimary: AppColors.gray.white,
  textSecondary: AppColors.gray.dark5,
  textSecondarySelected: AppColors.gray.white,
  carWidgetBackground: AppColors.primary.dark1,
  divider: AppColors.dividerDark,
  assetsGrayText: AppColors.primary.white1,
  notesCardIcon: AppColors.backgroundDark,
  notesCardShadow: Colors.transparent,
  textGray: AppColors.gray.dark4,
  notesStatusBanner: AppColors.backgroundDark,
  notesStatusBannerText: AppColors.primary.white1,
  dividerSensor: AppColors.dividerSensorDark,
  assetsSensorColor: AppColors.secondary.red,
  bookingDropdown: AppColors.primary.white1,
  bookingIconColor: AppColors.primary.white1,
  bookingPassengerText: AppColors.primary.white1,
  sellCarsGridLine: AppColors.dividerSensorDark,
  inactiveRed: AppColors.inactiveRedDark,
  sellCarsTooltip: AppColors.gray.white,
  sellCarsTooltipText: AppColors.gray.dark2,
  averagePrice: AppColors.gray.dark4,
  arcBackground: AppColors.gray.dark,
  offerParameters: AppColors.primary.white1,
  calendarDaysOfWeek: AppColors.primary.white1,
  calendarDays: AppColors.primary.white1,
  calendarToggleBackground: AppColors.calendarToggleBackgroundDark,
  stripeContainerBaseColor: AppColors.stripeContainerBaseColorDark,
  stripeContainerStripeColor: AppColors.stripeContainerStripeColorDark,
);
