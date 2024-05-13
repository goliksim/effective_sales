import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/models/flight_ticket_offers_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_elements/pre_search_offers/pre_search_offers_item.dart';
import 'package:flutter/material.dart';

class FlightPreSearchOffers extends StatefulWidget {
  const FlightPreSearchOffers({super.key, required this.offers});
  final List<FlightTicketOffersEntity> offers;
  final int minOffetsCount = 2;
  @override
  State<FlightPreSearchOffers> createState() => _FlightPreSearchOffersState();
}

class _FlightPreSearchOffersState extends State<FlightPreSearchOffers> {
  bool showAll = false;

  void _changeVisability() {
    setState(() {
      showAll = !showAll;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: context.myColors.grey1,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
          child: Column(
            children: [
              Text(
                context.S.f_pre_search_direct_flight,
                style: context.myStyles.title2,
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => FlightTicketOfferItem(
                  flightTicketOffer: widget.offers[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
                itemCount: showAll
                    ? widget.offers.length
                    : (widget.offers.length > widget.minOffetsCount ? widget.minOffetsCount : widget.offers.length),
              ),
              if (widget.offers.length >= widget.minOffetsCount)
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    _changeVisability();
                  },
                  child: SizedBox(
                    height: 42,
                    child: Center(
                      child: Text(
                        showAll ? context.S.f_pre_search_offers_hide : context.S.f_pre_search_offers_show_all,
                        style: context.myStyles.buttontext1.copyWith(
                          color: context.myColors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
