import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_route.dart';
import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_ticket_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'flight_offers_request_entity.freezed.dart';
part 'flight_offers_request_entity.g.dart';

@freezed
class FlightOffersRequestEntity with _$FlightOffersRequestEntity {
  const factory FlightOffersRequestEntity({
    required FlightRoute route,
    required DateTime date,
    DateTime? reverseDate,
    @Default(1) int ticketsCount,
    @Default(FlightTicketType.economy) FlightTicketType ticketsType,
    //timezone ...
  }) = _FlightOffersRequestEntity;

  factory FlightOffersRequestEntity.fromJson(Map<String, Object?> json) => _$FlightOffersRequestEntityFromJson(json);
}
