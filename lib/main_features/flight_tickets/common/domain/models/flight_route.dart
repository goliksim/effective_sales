import 'package:effective_sales/main_features/flight_tickets/common/domain/models/flight_route_part_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'flight_route.freezed.dart';
part 'flight_route.g.dart';

@freezed
class FlightRoute with _$FlightRoute {
  const factory FlightRoute({
    required FlightRoutePartEntity? departure,
    required FlightRoutePartEntity? arrival,
    //timezone ...
  }) = _FlightRoute;

  factory FlightRoute.fromJson(Map<String, Object?> json) => _$FlightRouteFromJson(json);
}
