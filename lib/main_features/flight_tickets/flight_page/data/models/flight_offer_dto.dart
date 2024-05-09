import 'package:effective_sales/common/domain/models/price_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_offer_dto.freezed.dart';
part 'flight_offer_dto.g.dart';

@freezed
class FlightOfferDto with _$FlightOfferDto {
  const factory FlightOfferDto({
    int? id,
    String? title,
    String? town,
    PriceEntity? price,
  }) = _FlightOfferDto;
  factory FlightOfferDto.fromJson(Map<String, Object?> json) => _$FlightOfferDtoFromJson(json);
}
