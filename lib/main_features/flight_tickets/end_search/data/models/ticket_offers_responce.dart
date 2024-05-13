import 'package:effective_sales/main_features/flight_tickets/end_search/data/models/ticket_offers_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_offers_responce.freezed.dart';
part 'ticket_offers_responce.g.dart';

@freezed
class TicketOffersResponce with _$TicketOffersResponce {
  const factory TicketOffersResponce({
    required List<TicketOffersDto> tickets,
  }) = _TicketOffersResponce;

  factory TicketOffersResponce.fromJson(Map<String, Object?> json) => _$TicketOffersResponceFromJson(json);
}
