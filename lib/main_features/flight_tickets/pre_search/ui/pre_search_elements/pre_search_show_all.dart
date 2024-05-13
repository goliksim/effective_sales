import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:flutter/material.dart';

class FlightPreSearchShowAll extends StatelessWidget {
  const FlightPreSearchShowAll({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.myColors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              context.S.f_pre_search_show_all,
              style: context.myStyles.buttontext1,
            ),
          ),
        ),
      ),
    );
  }
}
