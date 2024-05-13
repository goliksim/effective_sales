import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:effective_sales/common/domain/models/price_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/domain/models/ticket_offers_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FlightCard extends StatelessWidget {
  const FlightCard({super.key, required this.ticket});
  final TicketOffersEntity ticket;

  String formatTime(DateTime date) {
    return DateFormat.Hm().format(date);
  }

  String calculateDuration(DateTime arrival, DateTime departure) {
    double differenceInHours = arrival.difference(departure).inMinutes / 60;
    double roundedDifference = (differenceInHours * 2).round() / 2;
    return roundedDifference.toStringAsFixed(1).replaceAll('.0', '');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (ticket.badge == null) ? 117 : 117 + 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 0,
              child: SizedBox(
                height: 117,
                child: Padding(
                  padding: EdgeInsets.only(top: (ticket.badge != null) ? 8 : 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(top: (ticket.badge != null) ? 8 : 0),
                      backgroundColor: context.myColors.grey2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        (ticket.badge != null) ? 21 : 16,
                        16,
                        16,
                        16,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${formatPrice(ticket.price.value)} ${ticket.price.currency}',
                            style: context.myStyles.title1,
                          ),
                          SizedBox(
                            height: 38,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Center(
                                  child: CircleAvatar(
                                    radius: 12.0,
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                FlightPartWidget(
                                  time: formatTime(ticket.departure.date),
                                  airport: ticket.departure.airport,
                                ),
                                SizedBox(
                                  width: 16,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(3, 8, 3, 0),
                                    child: Divider(
                                      height: 1,
                                      color: context.myColors.grey6,
                                    ),
                                  ),
                                ),
                                FlightPartWidget(
                                  time: formatTime(ticket.arrival.date),
                                  airport: ticket.arrival.airport,
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Text(
                                  '${calculateDuration(ticket.arrival.date, ticket.departure.date)}${context.S.f_search_hour} ${context.S.f_search_in_flight}${ticket.hasTransfer ? '' : ' / ${context.S.f_search_no_transfers}'}',
                                  style: context.myStyles.text2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //BADGE
            if (ticket.badge != null)
              SizedBox(
                height: 21,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: context.myColors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
                    child: Text(
                      ticket.badge!,
                      style: context.myStyles.title4,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class FlightPartWidget extends StatelessWidget {
  const FlightPartWidget({super.key, required this.time, required this.airport});
  final String time;
  final String airport;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          time,
          style: context.myStyles.title4,
        ),
        Text(
          airport,
          style: context.myStyles.title4.copyWith(
            color: context.myColors.grey6,
          ),
        ),
      ],
    );
  }
}
