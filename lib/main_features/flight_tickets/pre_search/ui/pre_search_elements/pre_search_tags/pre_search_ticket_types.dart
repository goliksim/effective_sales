import 'dart:math';

import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:effective_sales/app/theme/effective_sales_icons.dart';
import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_ticket_type.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/ui/pre_search_elements/pre_search_tags/pre_search_tags_item.dart';
import 'package:flutter/material.dart';

class FlightPreSearchTypesTag extends StatelessWidget {
  const FlightPreSearchTypesTag({
    super.key,
    required this.onChanged,
    required this.ticketsType,
    required this.ticketsCount,
  });
  final FlightTicketType? ticketsType;
  final int? ticketsCount;
  final Function(int, FlightTicketType) onChanged;

  String _printTypes(BuildContext context) {
    late final String typeString;

    switch (ticketsType ?? FlightTicketType.economy) {
      case FlightTicketType.economy:
        typeString = context.S.flight_type_economy;
      case FlightTicketType.business:
        typeString = context.S.flight_type_business;
      case FlightTicketType.first:
        typeString = context.S.flight_type_first;
      default:
        typeString = context.S.flight_type_economy;
    }

    return '${ticketsCount ?? 1}, $typeString';
  }

  //TODO MOCK TYPES GENERATOR
  void _pickTicketTypes() {
    var (count, type) = _generateRandomTicketsType();

    onChanged(count, type);
  }

  (int, FlightTicketType) _generateRandomTicketsType() {
    final int count = Random().nextInt(3) + 1;
    final len = FlightTicketType.values.length - 1;
    final FlightTicketType type = FlightTicketType.values[Random().nextInt(len)];
    return (count, type);
  }

  @override
  Widget build(BuildContext context) {
    return PreSearchTagsElement(
      icon: Icon(
        EffectiveSalesIcons.profileSmall,
        size: 16,
        color: context.myColors.grey5,
      ),
      lable: Text(
        _printTypes(
          context,
        ),
        style: context.myStyles.title4,
      ),
      onPressed: () {
        _pickTicketTypes();
      },
    );
  }
}
