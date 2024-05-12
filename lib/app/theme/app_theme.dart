import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:flutter/material.dart';

abstract class MyTheme {
  /*static ThemeData lightData([String? color]) => ThemeData.light().copyWith(
        extensions: <ThemeExtension<dynamic>>[lightColors],
        splashColor: const Color(0x4D000000), //tertiary
      );*/

  static ThemeData dark() {
    MyColors colors = MyColors.darkColors();
    MyStyles styles = MyStyles.figma(isDark: true);
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'SFProDisplay',
    ).copyWith(
      extensions: <ThemeExtension<dynamic>>[
        colors,
        styles,
      ],
      scaffoldBackgroundColor: colors.black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: styles.tabtext,
        unselectedLabelStyle: styles.tabtext,
        selectedIconTheme: IconThemeData(
          color: colors.blue,
        ),
        unselectedIconTheme: IconThemeData(color: colors.grey6),
        selectedItemColor: colors.blue,
        unselectedItemColor: colors.grey6,
        showUnselectedLabels: true,
      ),
    );
  }
}

/* 
//FOR MANUAL SWITCH
class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;
  toggleTheme(bool isDark) {
    isDark ? ThemeMode.dark : ThemeMode.light;
  }
}*/
