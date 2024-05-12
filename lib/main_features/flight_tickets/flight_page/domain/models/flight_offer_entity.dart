import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:effective_sales/common/domain/models/price_entity.dart';
import 'package:flutter/foundation.dart';

part 'flight_offer_entity.freezed.dart';
part 'flight_offer_entity.g.dart';

@freezed
class FlightOfferEntity with _$FlightOfferEntity {
  const factory FlightOfferEntity({
    required int id,
    required String imageUrl,
    required String title,
    required String town,
    required PriceEntity price,
  }) = _FlightOfferEntity;

  factory FlightOfferEntity.fromJson(Map<String, Object?> json) => _$FlightOfferEntityFromJson(json);
}
