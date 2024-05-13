import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:effective_sales/app/theme/effective_sales_icons.dart';
import 'package:flutter/material.dart';

class FlightPreSearchSubcription extends StatefulWidget {
  const FlightPreSearchSubcription({super.key});

  @override
  State<FlightPreSearchSubcription> createState() => _FlightPreSearchSubcriptionState();
}

class _FlightPreSearchSubcriptionState extends State<FlightPreSearchSubcription> {
  bool checkboxValue = false;

  void _changeCheckboxValue(bool value) {
    setState(() {
      checkboxValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      child: Card(
        margin: EdgeInsets.zero,
        color: context.myColors.grey2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Icon(EffectiveSalesIcons.notification1, color: context.myColors.blue),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  context.S.f_pre_search_price_subscription,
                  style: context.myStyles.text1,
                ),
              ),
              Switch(
                inactiveThumbColor: context.myColors.white,
                inactiveTrackColor: context.myColors.grey5,
                activeColor: context.myColors.blue,
                activeTrackColor: context.myColors.darkBlue,
                value: checkboxValue,
                onChanged: (value) {
                  Feedback.forTap(context);
                  _changeCheckboxValue(
                    value,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
