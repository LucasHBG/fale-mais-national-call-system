import 'dart:ui';

import 'package:fale_mais_flutter/resources/colors/base_colors.dart';
import 'package:flutter/src/material/colors.dart' show MaterialColor;

class AppColors implements BaseColors {
  final Map<int, Color> _primary = const {
    50: Color.fromRGBO(255, 121, 198, 0.1),
    100: Color.fromRGBO(255, 121, 198, 0.2),
    200: Color.fromRGBO(255, 121, 198, 0.3),
    300: Color.fromRGBO(255, 121, 198, 0.4),
    400: Color.fromRGBO(255, 121, 198, 0.5),
    500: Color.fromRGBO(255, 121, 198, 0.6),
    600: Color.fromRGBO(255, 121, 198, 0.7),
    700: Color.fromRGBO(255, 121, 198, 0.8),
    800: Color.fromRGBO(255, 121, 198, 0.9),
    900: Color.fromRGBO(255, 121, 198, 1.0),
  };

  final Map<int, Color> _accent = const {
    50: Color.fromRGBO(255, 184, 108, 0.1),
    100: Color.fromRGBO(255, 184, 108, 0.2),
    200: Color.fromRGBO(255, 184, 108, 0.3),
    300: Color.fromRGBO(255, 184, 108, 0.4),
    400: Color.fromRGBO(255, 184, 108, 0.5),
    500: Color.fromRGBO(255, 184, 108, 0.6),
    600: Color.fromRGBO(255, 184, 108, 0.7),
    700: Color.fromRGBO(255, 184, 108, 0.8),
    800: Color.fromRGBO(255, 184, 108, 0.9),
    900: Color.fromRGBO(255, 184, 108, 1.0),
  };

  final Map<int, Color> _neutral = const {
    50: Color.fromRGBO(65, 69, 88, 0.1),
    100: Color.fromRGBO(65, 69, 88, 0.2),
    200: Color.fromRGBO(65, 69, 88, 0.3),
    300: Color.fromRGBO(65, 69, 88, 0.4),
    400: Color.fromRGBO(65, 69, 88, 0.5),
    500: Color.fromRGBO(65, 69, 88, 0.6),
    600: Color.fromRGBO(65, 69, 88, 0.7),
    700: Color.fromRGBO(65, 69, 88, 0.8),
    800: Color.fromRGBO(65, 69, 88, 0.9),
    900: Color.fromRGBO(65, 69, 88, 1.0),
  };

//Theme color

  @override
  MaterialColor get colorPrimary => MaterialColor(0xffff79c6, _primary);

  @override
  MaterialColor get colorAccent => MaterialColor(0xffffb86c, _accent);

  @override
  MaterialColor get colorNeutral => MaterialColor(0xff414558, _neutral);

  //Background color

  @override
  Color get colorBackground => const Color(0xff282a36);

  //Text color

  @override
  Color get colorNeutralText => const Color(0xffC2CAF5);

  @override
  Color get colorAccentText => const Color(0xff472500);

  @override
  Color get colorPrimaryText => const Color(0xffC7CCE5);

  //Extra color

  @override
  Color get colorBackgroundBox => const Color(0xfff8f8f8);

  @override
  Color get colorCustomBlack => const Color(0xff000000);
}
