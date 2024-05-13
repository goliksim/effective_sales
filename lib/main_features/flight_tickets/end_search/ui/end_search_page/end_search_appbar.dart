import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:effective_sales/app/theme/effective_sales_icons.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/bloc/flight_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class FlightSearchAppBar extends StatelessWidget {
  const FlightSearchAppBar({super.key});

  String _formatDate(DateTime date, BuildContext context, [DateTime? reverseDate]) {
    final locale = Localizations.localeOf(context).languageCode;
    if (reverseDate != null) {
      return '${DateFormat('d MMMM', locale).format(date)} - ${DateFormat('d MMMM', locale).format(reverseDate)}';
    }
    return DateFormat('d MMMM', locale).format(date);
  }

  String _correctPassengerName(BuildContext context, int count) {
    if (count == 1) {
      return context.S.f_search_passenger;
    } else if (count > 4) {
      return context.S.f_search_passengerss;
    }
    return context.S.f_search_passengers;
  }

  @override
  Widget build(BuildContext context) {
    final requestEntity = context.flightSearchState?.requestEntity;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: context.myColors.grey2,
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: Row(
            children: [
              IconButton(
                splashRadius: 20,
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  EffectiveSalesIcons.back,
                  color: context.myColors.blue,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${requestEntity?.route.departure?.localTown ?? ''} - ${requestEntity?.route.arrival?.localTown ?? ''}',
                      style: context.myStyles.title3,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    if (requestEntity?.date != null && requestEntity?.ticketsCount != null)
                      Text(
                        '${_formatDate(requestEntity!.date, context, requestEntity.reverseDate)}, ${requestEntity.ticketsCount} ${_correctPassengerName(context, requestEntity.ticketsCount)}',
                        style: context.myStyles.title4.copyWith(
                          color: context.myColors.grey6,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
