import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'flight_entity.freezed.dart';
part 'flight_entity.g.dart';

@freezed
class FlightEntity with _$FlightEntity {
  const factory FlightEntity({
    required String town,
    required DateTime date,
    required String airport,
  }) = _FlightEntity;

  factory FlightEntity.fromJson(Map<String, Object?> json) => _$FlightEntityFromJson(json);
}
