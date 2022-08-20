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

  //extra color
  Color get colorCustomWhite;
  Color get colorCustomBlack;
}
