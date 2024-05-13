part of 'flight_search_bloc.dart';

@freezed
abstract class FlightSearchEvent with _$FlightSearchEvent {
  const factory FlightSearchEvent.loadRoute(FlightRoute route) = _FlightSearchLoad;
  const factory FlightSearchEvent.preSearch() = _FlightPreSearch;
  const factory FlightSearchEvent.toSearch(BuildContext context) = _FlightToSearch;
  const factory FlightSearchEvent.search() = _FlightSearch;

  const factory FlightSearchEvent.updateRequestDate(DateTime date) = _FlightSearchDateChanger;
  const factory FlightSearchEvent.updateReverseDate(DateTime? date) = _FlightSearchWayChanger;
  const factory FlightSearchEvent.updateTicketTypes(int count, FlightTicketType type) = _FlightSearchTypesChanger;
}
