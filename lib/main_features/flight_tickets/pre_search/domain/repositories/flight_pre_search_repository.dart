import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/models/flight_offers_request_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/models/flight_ticket_offers_entity.dart';

abstract interface class FlightPreSearchRepository {
  Future<List<FlightTicketOffersEntity>> getTicketsOffers(FlightOffersRequestEntity requestEntity);
}
