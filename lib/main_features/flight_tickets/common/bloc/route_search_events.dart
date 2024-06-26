part of 'route_search_bloc.dart';

@freezed
abstract class RouteSearchEvent with _$RouteSearchEvent {
  const factory RouteSearchEvent.load() = _LoadRouteSearch;
  const factory RouteSearchEvent.confirmArrivalByString(String newArrival, BuildContext? context) =
      _ArrivalStringConfirm;

  const factory RouteSearchEvent.confirmDepartureByString(String newDeparture, BuildContext? context) =
      _DepartureStringConfirm;

  const factory RouteSearchEvent.pickRandomArrival(BuildContext? context) = _PickRandomArrival;

  const factory RouteSearchEvent.swap() = _SwapRouteSearch;

  const factory RouteSearchEvent.clearArrival() = _ClearArrivalRouteSearch;
}
