import 'package:effective_sales/main_features/flight_tickets/flight_page/data/datasources/flight_departure_datasource_prefs_impl.dart';
import 'package:effective_sales/main_features/flight_tickets/flight_page/domain/repositories/flight_departure_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FlightDepartureRepositoryImpl implements FlightDepartureRepository {
  FlightDepartureRepositoryImpl(this.datasource);

  final FlightDepartureLocalStorageDatasourcePref datasource;

  @override
  Future<String?> getLastDeparture() {
    return datasource.getLastDeparture();
  }

  @override
  Future<bool> writeLastDeparture(String newDeparture) {
    return datasource.writeLastDeparture(newDeparture);
  }
}
