import 'package:flutter/material.dart';

extension MyThemeBuilder on BuildContext {
  MyColors get myColors => Theme.of(this).extension<MyColors>() ?? MyColors.darkColors();
}

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.black,
    required this.grey1,
    required this.grey2,
    required this.grey3,
    required this.grey4,
    required this.grey5,
    required this.grey6,
    required this.grey7,
    required this.white,
    required this.blue,
    required this.darkBlue,
    required this.green,
    required this.darkGreen,
    required this.red,
    required this.orange,
  });

  final Color black;
  final Color grey1;
  final Color grey3;
  final Color grey4;
  final Color grey5;
  final Color grey6;
  final Color grey7;
  final Color grey2;
  final Color white;
  final Color blue;
  final Color darkBlue;
  final Color green;
  final Color darkGreen;
  final Color red;
  final Color orange;

  static MyColors darkColors() => const MyColors(
        black: Color(0xFF0C0C0C),
        grey1: Color(0xFF1D1E20),
        grey2: Color(0xFF242529),
        grey3: Color(0xFF2f3035),
        grey4: Color(0xFF3E3F43),
        grey5: Color(0xFF5E5F61),
        grey6: Color(0xFF9F9F9F),
        grey7: Color(0xFFDBDBDB),
        white: Color(0xFFFFFFFF),
        blue: Color(0xFF2261BC),
        darkBlue: Color(0xFF00427d),
        green: Color(0xFF3A633B),
        darkGreen: Color(0xFF1e341f),
        red: Color(0xFFff5d5d),
        orange: Color(0xFFf36e36),
      );

  //Light theme
  /*static MyColors lightColors() => const MyColors(
        black: Color(0xFF0C0C0C),
        grey1: Color(0xFF1D1E20),
        grey2: Color(0xFF242529),
        grey3: Color(0xFF2f3035),
        grey4: Color(0xFF3E3F43),
        grey5: Color(0xFF5E5F61),
        grey6: Color(0xFF9F9F9F),
        grey7: Color(0xFFDBDBDB),
        white: Color(0xFFFFFFFF),
        blue: Color(0xFF4C95FE),
        darkBlue: Color(0xFF00427d),
        green: Color(0xFF4CB24E),
        darkGreen: Color(0xFF1e341f),
        red: Color(0xFFff5d5d),
        orange: Color(0xFFf36e36),
      );*/

  @override
  MyColors copyWith() {
    return this;
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    return this;
  }
}
