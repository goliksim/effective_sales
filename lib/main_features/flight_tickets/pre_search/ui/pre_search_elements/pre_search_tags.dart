import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:effective_sales/app/logger.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:effective_sales/app/theme/effective_sales_icons.dart';
import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_ticket_type.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/bloc/flight_search_bloc.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_elements/pre_search_tags/pre_search_date_tag.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_elements/pre_search_tags/pre_search_tags_item.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_elements/pre_search_tags/pre_search_ticket_types.dart';
import 'package:flutter/material.dart';

class FlightPreSearchTags extends StatelessWidget {
  const FlightPreSearchTags({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.flightSearchBloc?.state.requestEntity;
    logger.log('build tags with $request');
    final List<Widget> tags = [
      //REVERSE
      FlightPreSearchDateTags(
        isReverse: true,
        reverseDate: request?.reverseDate,
        selectedDate: request?.date,
        onPressed: (date) {
          context.flightSearchBloc?.updateReverseDate(date);
        },
        onLongPressed: () {
          context.flightSearchBloc?.updateReverseDate(null);
        },
      ),
      FlightPreSearchDateTags(
        reverseDate: request?.reverseDate,
        selectedDate: (request != null) ? request.date : DateTime.now(),
        onPressed: (date) {
          context.flightSearchBloc?.updateRequestDate(date);
        },
        onLongPressed: () {
          context.flightSearchBloc?.updateRequestDate(DateTime.now());
        },
      ),
      FlightPreSearchTypesTag(
        ticketsType: request?.ticketsType,
        ticketsCount: request?.ticketsCount,
        onChanged: (int count, FlightTicketType type) {
          context.flightSearchBloc?.updateTicketTypes(count, type);
        },
      ),
      PreSearchTagsElement(
        icon: const Icon(EffectiveSalesIcons.filter, size: 16),
        lable: Text(
          context.S.f_pre_search_tags_filter,
          style: context.myStyles.title4,
        ),
        onPressed: () {},
      ),
    ];
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) => tags[index]),
      physics: const BouncingScrollPhysics(),
      separatorBuilder: ((context, index) => const SizedBox(width: 8)),
      itemCount: tags.length,
    );
  }
}
