import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'price_dto.freezed.dart';
part 'price_dto.g.dart';

@freezed
class PriceDto with _$PriceDto {
  const factory PriceDto({
    required int? value,
    @Default('₽') String? currency,
  }) = _PriceDto;

  factory PriceDto.fromJson(Map<String, Object?> json) => _$PriceDtoFromJson(json);
}
