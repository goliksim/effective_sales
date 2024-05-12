import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/bloc/flight_page_bloc.dart';
import 'package:flutter/material.dart';

class FlightOffersError extends StatelessWidget {
  const FlightOffersError({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      fillOverscroll: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.warning_rounded,
              size: 36,
              color: context.myColors.orange,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              context.S.network_error_title,
              style: context.myStyles.title2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              context.S.network_error_body,
              style: context.myStyles.text1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              onPressed: () => context.flightPageBloc?.load(),
              child: SizedBox(
                width: double.infinity,
                height: 24,
                child: Text(
                  context.S.network_error_retry,
                  textAlign: TextAlign.center,
                  style: context.myStyles.buttontext1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
