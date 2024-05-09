import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/models/flight_offer_entity.dart';

abstract interface class FlightOffersRepository {
  Future<FlightOfferEntity?> getOfferById(int id);
  Future<List<FlightOfferEntity>> getOfferEntities();
}
