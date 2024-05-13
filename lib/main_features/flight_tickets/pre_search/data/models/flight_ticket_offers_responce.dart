import 'package:effective_sales/main_features/flight_tickets/pre_search/data/models/flight_ticket_offers_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_ticket_offers_responce.freezed.dart';
part 'flight_ticket_offers_responce.g.dart';

@freezed
class FlightTicketOffersResponce with _$FlightTicketOffersResponce {
  const factory FlightTicketOffersResponce({
    @JsonKey(name: 'tickets_offers') required List<FlightTicketOffersDto> offers,
  }) = _FlightTicketOffersResponce;
  factory FlightTicketOffersResponce.fromJson(Map<String, Object?> json) => _$FlightTicketOffersResponceFromJson(json);
}
