import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'flight_route_part_entity.freezed.dart';
part 'flight_route_part_entity.g.dart';

@freezed
class FlightRoutePartEntity with _$FlightRoutePartEntity {
  const factory FlightRoutePartEntity({
    required int townId,
    required String localContry,
    required String localTown,
  }) = _FlightRoutePartEntity;

  factory FlightRoutePartEntity.fromJson(Map<String, Object?> json) => _$FlightRoutePartEntityFromJson(json);
}
