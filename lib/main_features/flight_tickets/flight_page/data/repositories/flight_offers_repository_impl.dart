import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/models/flight_offer_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/repositories/flight_offers_repository.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/repositories/network_flight_offers_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FlightOffersRepositoryImpl implements FlightOffersRepository {
  final NetworkFlightOffersRepository datasource;

  FlightOffersRepositoryImpl(this.datasource);
  @override
  Future<FlightOfferEntity?> getOfferById(int id) {
    return datasource.getOfferById(id);
  }

  @override
  Future<List<FlightOfferEntity>> getOfferEntities() {
    return datasource.fetchOffers();
  }
}
