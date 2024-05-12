import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/models/flight_offer_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/ui/flight_page_offers/flight_offers_widget/flight_offers_listview.dart';
import 'package:flutter/material.dart';

class FlightOffersWidget extends StatelessWidget {
  const FlightOffersWidget({super.key, required this.flightOffers});
  final List<FlightOfferEntity> flightOffers;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 36, 12, 0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  context.S.f_page_offers_title,
                  style: context.myStyles.title1,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 213.16,
              child: FlightOffersListView(
                flightOffers: flightOffers,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Placeholder(),
          ],
        ),
      ),
    );
  }
}
