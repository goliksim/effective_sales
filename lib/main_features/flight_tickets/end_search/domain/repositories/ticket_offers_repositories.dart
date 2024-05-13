import 'package:effective_sales/main_features/flight_tickets/end_search/domain/models/ticket_offers_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/models/flight_offers_request_entity.dart';

abstract interface class TicketOffersRepository {
  Future<List<TicketOffersEntity>> getTicketOffers(FlightOffersRequestEntity requestEntity);
}
