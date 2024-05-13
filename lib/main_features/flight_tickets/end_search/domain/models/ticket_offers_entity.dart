import 'package:effective_sales/common/domain/models/price_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/end_search/domain/models/flight_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'ticket_offers_entity.freezed.dart';
part 'ticket_offers_entity.g.dart';

@freezed
class TicketOffersEntity with _$TicketOffersEntity {
  const factory TicketOffersEntity({
    required int id,
    required String? badge,
    required String company,
    required PriceEntity price,
    required FlightEntity departure,
    required FlightEntity arrival,
    required bool hasTransfer,
  }) = _TicketOffersEntity;

  factory TicketOffersEntity.fromJson(Map<String, Object?> json) => _$TicketOffersEntityFromJson(json);
}
