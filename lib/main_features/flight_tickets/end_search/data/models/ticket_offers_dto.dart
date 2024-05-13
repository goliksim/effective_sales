import 'package:effective_sales/common/data/models/price_dto.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/data/models/flight_dto.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/data/models/hand_luggage_dto.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/data/models/luggage_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'ticket_offers_dto.freezed.dart';
part 'ticket_offers_dto.g.dart';

@freezed
class TicketOffersDto with _$TicketOffersDto {
  const factory TicketOffersDto({
    required int? id,
    required String? badge,
    @JsonKey(name: 'provider_name') required String? providerName,
    required String? company,
    required PriceDto? price,
    required FlightDto? departure,
    required FlightDto? arrival,
    @JsonKey(name: 'has_transfer') required bool? hasTransfer,
    @JsonKey(name: 'has_visa_transfer') required bool? hasVisaTransfer,
    required LuggageDto? luggage,
    @JsonKey(name: 'hand_luggage') required HandLuggageDto? handLuggage,
    @JsonKey(name: 'is_returnable') required bool? isReturnable,
    @JsonKey(name: 'is_exchangeable') required bool? isExchangeable,

    //timezone ...
  }) = _TicketOffersDto;

  factory TicketOffersDto.fromJson(Map<String, Object?> json) => _$TicketOffersDtoFromJson(json);
}
