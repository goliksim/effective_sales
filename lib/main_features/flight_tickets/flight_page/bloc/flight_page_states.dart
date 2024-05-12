part of 'flight_page_bloc.dart';

@freezed
class FlightPageState with _$FlightPageState {
  const factory FlightPageState.init() = _FlightInitialState;

  const factory FlightPageState.loaded(
    List<FlightOfferEntity> flightOffers,
  ) = _FlightLoadedState;

  const factory FlightPageState.empty() = _FlightEmptyState;

  const factory FlightPageState.error() = _ErrorFlightState;
}
