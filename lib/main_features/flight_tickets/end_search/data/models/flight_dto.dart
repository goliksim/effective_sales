import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'flight_dto.freezed.dart';
part 'flight_dto.g.dart';

@freezed
class FlightDto with _$FlightDto {
  const factory FlightDto({
    required String? town,
    required DateTime? date,
    required String? airport,
  }) = _FlightDto;

  factory FlightDto.fromJson(Map<String, Object?> json) => _$FlightDtoFromJson(json);
}
