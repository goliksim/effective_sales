import 'package:effective_sales/main_features/flight_tickets/flight_page/data/models/flight_offer_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_offer_responce.freezed.dart';
part 'flight_offer_responce.g.dart';

@freezed
class FlightOfferResponce with _$FlightOfferResponce {
  const factory FlightOfferResponce({
    List<FlightOfferDto>? offers,
  }) = _FlightOfferResponce;
  factory FlightOfferResponce.fromJson(Map<String, Object?> json) => _$FlightOfferResponceFromJson(json);
}
