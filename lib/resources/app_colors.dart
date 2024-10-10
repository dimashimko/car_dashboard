import 'dart:ui';

class AppColors {
  AppColors._();

  static final Primary primary = Primary();
  static final Secondary secondary = Secondary();
  static final Tertiary tertiary = Tertiary();
  static final Gray gray = Gray();

  // static const Color white = Color(0xffffffff);
  // static const Color black = Color(0xff000000);
  static const Color grayF5 = Color(0xffF5F5F5);
  static const Color lightShadeBlueGray = Color(0xffF3F5F8);
  static const Color darkShadeBlueGray = Color(0xff292E3D);
}

class Primary {
  Color purple = const Color(0xFFA162F7);
  Color dark1 = const Color(0xFF242731);
  Color white1 = const Color(0xFFE0E4E7);
}

class Secondary {
  Color red = const Color(0xFFFF6370);
  Color yellow = const Color(0xFFF6CC0D);
  Color blue = const Color(0xFF2884FF);
  Color green = const Color(0xFF70CF97);
  Color orange = const Color(0xFFFF764C);
}

class Tertiary {
  Color secondary1 = const Color(0xFFE1DFA4);
  Color secondary2 = const Color(0xFFE3ECF1);
  Color secondary3 = const Color(0xFFF9F0F1);
}

class Gray {
  Color dark = const Color(0xFF1F2128);
  Color dark2 = const Color(0xFF5F6165);
  Color dark3 = const Color(0xFF72767C);
  Color dark4 = const Color(0xFF7C7C8D);
  Color dark5 = const Color(0xFF808191);
  Color dark6 = const Color(0xFFA4A5A6);
  Color white = const Color(0xFFFFFFFF);
}
