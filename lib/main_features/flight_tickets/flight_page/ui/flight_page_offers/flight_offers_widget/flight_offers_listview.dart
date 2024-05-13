import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/models/flight_offer_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/ui/flight_page_offers/flight_offers_widget/flight_offer_view.dart';
import 'package:flutter/material.dart';

class FlightOffersListView extends StatelessWidget {
  const FlightOffersListView({
    super.key,
    required this.flightOffers,
  });
  final List<FlightOfferEntity> flightOffers;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => FlightOfferView(
        flightOffer: flightOffers[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        width: 67,
      ),
      itemCount: flightOffers.length,
      scrollDirection: Axis.horizontal,
    );
  }
}
