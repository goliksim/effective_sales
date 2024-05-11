import 'package:flutter/material.dart';

extension MyThemeBuilder on BuildContext {
  MyStyles get myStyles => Theme.of(this).extension<MyStyles>() ?? MyStyles.figma();
}

class MyStyles extends ThemeExtension<MyStyles> {
  const MyStyles({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.text1,
    required this.text2,
    required this.buttontext1,
    required this.tabtext,
  });

  static MyStyles figma({bool isDark = false}) => MyStyles(
        title1: createStyle(
          fontSize: 22,
          figmaHeight: 26.4,
          fontWeight: FontWeight.w600,
          color: Color(isDark ? 0xFFFFFFFF : 0xFF0C0C0C),
        ),
        title2: createStyle(
          fontSize: 20,
          figmaHeight: 24,
          fontWeight: FontWeight.w600,
          color: Color(isDark ? 0xFFFFFFFF : 0xFF0C0C0C),
        ),
        title3: createStyle(
          fontSize: 16,
          figmaHeight: 19.2,
          fontWeight: FontWeight.w600,
          color: Color(isDark ? 0xFFFFFFFF : 0xFF0C0C0C),
        ),
        title4: createStyle(fontSize: 14, figmaHeight: 16.8, color: Color(isDark ? 0xFFFFFFFF : 0xFF0C0C0C)),
        text1: createStyle(
          fontSize: 16,
          figmaHeight: 19.2,
          fontWeight: FontWeight.w500,
          color: Color(isDark ? 0xFFFFFFFF : 0xFF0C0C0C),
        ),
        text2: createStyle(
          fontSize: 14,
          figmaHeight: 16.8,
          fontWeight: FontWeight.w400,
          color: Color(isDark ? 0xFFFFFFFF : 0xFF0C0C0C),
        ),
        buttontext1: createStyle(
          fontSize: 16,
          figmaHeight: 20.8,
          fontWeight: FontWeight.w600,
          color: Color(isDark ? 0xFFFFFFFF : 0xFF0C0C0C),
        ),
        tabtext: createStyle(
          fontSize: 10,
          figmaHeight: 11,
          fontWeight: FontWeight.w400,
          color: Color(isDark ? 0xFFFFFFFF : 0xFF0C0C0C),
        ),
      );

  final TextStyle title1;
  final TextStyle title2;
  final TextStyle title3;
  final TextStyle title4;
  final TextStyle text1;
  final TextStyle text2;
  final TextStyle buttontext1;
  final TextStyle tabtext;

  static TextStyle createStyle({
    double fontSize = 14,
    FontWeight? fontWeight = FontWeight.normal,
    Color? color = Colors.black,
    double? figmaHeight,
    String? fontFamily = 'SFProDisplay',
  }) {
    final height = (figmaHeight ?? fontSize) / fontSize;

    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  @override
  MyStyles copyWith() {
    return this;
  }

  @override
  MyStyles lerp(ThemeExtension<MyStyles>? other, double t) {
    return this;
  }
}
