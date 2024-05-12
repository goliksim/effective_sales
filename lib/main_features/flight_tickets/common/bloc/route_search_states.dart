part of 'route_search_bloc.dart';

@freezed
class RouteSearchState with _$RouteSearchState {
  const factory RouteSearchState.init({
    required FlightRoute flightRoute,
  }) = _RouteSearchInitial;

  const factory RouteSearchState.loaded({
    required FlightRoute flightRoute,
  }) = _RouteSearchLoaded;
}
