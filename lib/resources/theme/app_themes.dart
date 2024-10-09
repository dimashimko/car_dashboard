import 'package:flutter/material.dart';

import '../app_fonts.dart';
import 'custom_theme_extension.dart';

class AppThemes {
  const AppThemes._();

  static ThemeData light() {
    return ThemeData(
      fontFamily: AppFonts.fontFamily,
      listTileTheme: const ListTileThemeData(
        horizontalTitleGap: 20,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xFF1F1F39),
        selectionColor: Color(0xFF858597),
        selectionHandleColor: Color(0xFF858597),
      ),
      scaffoldBackgroundColor:
          lightCustomThemeExtension.scaffoldBackgroundColor,
      // colorScheme: const ColorScheme.light().copyWith(
      //   primary: CustomThemeExtension.light.scaffoldBackgroundColor,
      //   onPrimary: CustomThemeExtension.light.brownWhite,
      //   surface: CustomThemeExtension.light.scaffoldBackgroundColor,
      //   onSurface: CustomThemeExtension.light.brownWhite,
      // ),
      extensions: <ThemeExtension>[
        lightCustomThemeExtension,
      ],
    );
  }

  static ThemeData dark() {
    return ThemeData(
      fontFamily: AppFonts.fontFamily,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xFFFFFFFF),
        selectionColor: Color(0xFFB8B8D2),
        selectionHandleColor: Color(0xFFB8B8D2),
      ),
      scaffoldBackgroundColor: darkCustomThemeExtension.scaffoldBackgroundColor,
      // colorScheme: const ColorScheme.dark().copyWith(
      //   primary: CustomThemeExtension.dark.scaffoldBackgroundColor,
      //   onPrimary: CustomThemeExtension.dark.brownWhite,
      //   surface: CustomThemeExtension.dark.scaffoldBackgroundColor,
      //   onSurface: CustomThemeExtension.dark.brownWhite,
      // ),
      extensions: <ThemeExtension>[
        darkCustomThemeExtension,
      ],
    );
  }
}

// primary: Colors.blue,
// onPrimary: Colors.blue,
// primaryContainer: Colors.blue,
// onPrimaryContainer: Colors.blue,
// secondary: Colors.blue,
// onSecondary: Colors.blue,
// secondaryContainer: Colors.blue,
// onSecondaryContainer: Colors.blue,
// tertiary: Colors.blue,
// onTertiary: Colors.blue,
// tertiaryContainer: Colors.blue,
// onTertiaryContainer: Colors.blue,
// error: Colors.blue,
// onError: Colors.blue,
// errorContainer: Colors.blue,
// onErrorContainer: Colors.blue,
// background: Colors.blue,
// onBackground: Colors.blue,
// surface: Colors.blue,
// onSurface: Colors.blue,
// surfaceVariant: Colors.blue,
// onSurfaceVariant: Colors.blue,
// outline: Colors.blue,
// outlineVariant: Colors.blue,
// shadow: Colors.blue,
// scrim: Colors.blue,
// inverseSurface: Colors.blue,
// onInverseSurface: Colors.blue,
// inversePrimary: Colors.blue,
// surfaceTint: Colors.blue,
