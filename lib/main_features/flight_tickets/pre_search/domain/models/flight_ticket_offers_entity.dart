import 'package:effective_sales/common/domain/models/price_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'flight_ticket_offers_entity.freezed.dart';
part 'flight_ticket_offers_entity.g.dart';

@freezed
class FlightTicketOffersEntity with _$FlightTicketOffersEntity {
  const factory FlightTicketOffersEntity({
    required int id,
    required String title,
    required List<String> timeRanges,
    required PriceEntity price,
    //timezone ...
  }) = _FlightTicketOffersEntity;

  factory FlightTicketOffersEntity.fromJson(Map<String, Object?> json) => _$FlightTicketOffersEntityFromJson(json);
}
