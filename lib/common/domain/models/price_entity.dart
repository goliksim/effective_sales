import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'price_entity.freezed.dart';
part 'price_entity.g.dart';

@freezed
class PriceEntity with _$PriceEntity {
  const factory PriceEntity({
    required int value,
  }) = _PriceEntity;

  factory PriceEntity.fromJson(Map<String, Object?> json) => _$PriceEntityFromJson(json);
}
