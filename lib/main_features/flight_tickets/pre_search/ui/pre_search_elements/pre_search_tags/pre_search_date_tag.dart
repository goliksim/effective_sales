import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:effective_sales/app/theme/effective_sales_icons.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_elements/pre_search_tags/pre_search_tags_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FlightPreSearchDateTags extends StatelessWidget {
  const FlightPreSearchDateTags({
    super.key,
    required this.selectedDate,
    required this.onPressed,
    this.onLongPressed,
    this.isReverse = false,
    this.reverseDate,
  });
  final Function(DateTime) onPressed;
  final Function()? onLongPressed;
  final DateTime? selectedDate;
  final DateTime? reverseDate;
  final bool isReverse;

  String _formatDate(DateTime date, BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final day = DateFormat('d MMM', locale).format(date);
    return day;
  }

  String _getWeekDay(DateTime date, BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final weekDay = DateFormat('EE', locale).format(date);
    return weekDay;
  }

  void _selectDate(BuildContext context) async {
    final DateTime currentDate = selectedDate ?? DateTime.now();
    final DateTime reverseNewDate = reverseDate ?? currentDate;
    final DateTime maxDate = DateTime.now().add(
      const Duration(
        days: 365 * 2,
      ),
    );
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isReverse ? reverseNewDate : currentDate,
      firstDate: isReverse ? currentDate : DateTime.now(),
      lastDate: isReverse ? maxDate : ((reverseDate == null) ? maxDate : reverseDate!),
    );
    if (picked != null && picked != currentDate) {
      onPressed(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final date = (isReverse ? reverseDate : selectedDate);
    return PreSearchTagsElement(
      icon: (isReverse && date == null)
          ? const Icon(
              EffectiveSalesIcons.plus,
              size: 16,
            )
          : null,
      lable: Row(
        children: [
          if (isReverse)
            Text(
              '${context.S.f_pre_search_tags_reverse} ',
              style: context.myStyles.title4,
            ),
          if (date != null)
            Text(
              _formatDate(date, context),
              style: context.myStyles.title4,
            ),
          if (date != null)
            Text(
              ', ${_getWeekDay(date, context)}',
              style: context.myStyles.title4.copyWith(
                color: context.myColors.grey6,
              ),
            ),
        ],
      ),
      onPressed: () {
        _selectDate(context);
      },
      onLongPress: () => onLongPressed?.call(),
    );
  }
}
