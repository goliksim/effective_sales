import 'package:effective_sales/common/data/models/price_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'luggage_dto.freezed.dart';
part 'luggage_dto.g.dart';

@freezed
class LuggageDto with _$LuggageDto {
  const factory LuggageDto({
    @JsonKey(name: 'has_luggage') required bool? hasLuggage,
    required PriceDto? price,
  }) = _LuggageDto;

  factory LuggageDto.fromJson(Map<String, Object?> json) => _$LuggageDtoFromJson(json);
}
