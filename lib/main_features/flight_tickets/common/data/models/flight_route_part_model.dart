import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'flight_route_part_model.freezed.dart';
part 'flight_route_part_model.g.dart';

@freezed
class FlightRoutePartModel with _$FlightRoutePartModel {
  const factory FlightRoutePartModel({
    required int? townId,
    required String? localContry,
    required String? localTown,
  }) = _FlightRoutePartModel;

  factory FlightRoutePartModel.fromJson(Map<String, Object?> json) => _$FlightRoutePartModelFromJson(json);
}
