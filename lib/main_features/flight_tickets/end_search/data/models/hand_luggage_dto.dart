import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'hand_luggage_dto.freezed.dart';
part 'hand_luggage_dto.g.dart';

@freezed
class HandLuggageDto with _$HandLuggageDto {
  const factory HandLuggageDto({
    @JsonKey(name: 'has_hand_luggage') required bool? hasHandLuggage,
    required String? size,
  }) = _HandLuggageDto;

  factory HandLuggageDto.fromJson(Map<String, Object?> json) => _$HandLuggageDtoFromJson(json);
}
