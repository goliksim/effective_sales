import 'package:effective_sales/common/domain/models/price_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'flight_ticket_offers_dto.freezed.dart';
part 'flight_ticket_offers_dto.g.dart';

@freezed
class FlightTicketOffersDto with _$FlightTicketOffersDto {
  const factory FlightTicketOffersDto({
    int? id,
    String? title,
    @JsonKey(name: 'time_range') List<String>? timeRanges,
    PriceEntity? price,
    //timezone ...
  }) = _FlightTicketOffersDto;

  factory FlightTicketOffersDto.fromJson(Map<String, Object?> json) => _$FlightTicketOffersDtoFromJson(json);
}
