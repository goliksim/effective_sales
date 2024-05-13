import 'package:effective_sales/main_features/flight_tickets/end_search/domain/models/ticket_offers_entity.dart';
import 'package:flutter/material.dart';

import 'flight_card.dart';

class FlightSearchBody extends StatelessWidget {
  const FlightSearchBody({
    super.key,
    required this.tickets,
  });
  final List<TicketOffersEntity> tickets;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => FlightCard(
        ticket: tickets[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
      itemCount: tickets.length,
    );
  }
}
