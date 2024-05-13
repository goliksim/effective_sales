import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:effective_sales/app/theme/effective_sales_icons.dart';
import 'package:effective_sales/common/domain/models/price_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/models/flight_offer_entity.dart';
import 'package:flutter/material.dart';

class FlightOfferView extends StatelessWidget {
  const FlightOfferView({super.key, required this.flightOffer});
  final FlightOfferEntity flightOffer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 132,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            //TODO IMAGE MOCK (CHANGE TO IMAGE.NETWORK)
            child: Image.asset(
              fit: BoxFit.fitHeight,
              height: 132,
              flightOffer.imageUrl,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            flightOffer.title,
            style: context.myStyles.title3,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            flightOffer.town,
            style: context.myStyles.text2,
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              const Icon(
                EffectiveSalesIcons.plane,
              ),
              Text(
                '${context.S.price_from} ${formatPrice(flightOffer.price.value)} ${flightOffer.price.currency}',
                style: context.myStyles.text2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
