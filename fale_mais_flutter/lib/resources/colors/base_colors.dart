import 'package:flutter/material.dart';

abstract class BaseColors {
  //Theme color
  MaterialColor get colorPrimary;
  MaterialColor get colorAccent;
  MaterialColor get colorNeutral;
  Color get colorBackground;

  //text color
  Color get colorPrimaryText;
  Color get colorNeutralText;
  Color get colorAccentText;

  //extra color
  Color get colorBackgroundBox;
  Color get colorCustomBlack;
}
