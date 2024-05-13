import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:effective_sales/app/theme/effective_sales_icons.dart';
import 'package:effective_sales/common/domain/models/price_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/models/flight_ticket_offers_entity.dart';
import 'package:flutter/material.dart';

class FlightTicketOfferItem extends StatelessWidget {
  const FlightTicketOfferItem({super.key, required this.flightTicketOffer});
  final FlightTicketOffersEntity flightTicketOffer;

  //MOCK COLOR GENERATOR
  Color _getColorById(int id, BuildContext context) {
    switch (id) {
      case 1:
        return context.myColors.red;
      case 10:
        return context.myColors.blue;
      case 30:
        return context.myColors.white;
      default:
        return context.myColors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () {},
      child: SizedBox(
        height: 56,
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        //TODO IMAGE MOCK (CHANGE TO IMAGE.NETWORK)

                        child: ColoredBox(
                          color: _getColorById(flightTicketOffer.id, context),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              flightTicketOffer.title,
                              style: context.myStyles.title4,
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            Text(
                              '${formatPrice(flightTicketOffer.price.value)} ${flightTicketOffer.price.currency}',
                              style: context.myStyles.title4.copyWith(
                                color: context.myColors.blue,
                              ),
                            ),
                            Icon(
                              EffectiveSalesIcons.rightarrow,
                              color: context.myColors.blue,
                              size: 16,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          flightTicketOffer.timeRanges.join('  '),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.myStyles.text2,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}
