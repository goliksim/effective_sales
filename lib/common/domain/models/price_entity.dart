import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

part 'price_entity.freezed.dart';
part 'price_entity.g.dart';

final formatter = NumberFormat('#,###');
String formatPrice(int value) => formatter.format(value).replaceAll(',', ' ');

@freezed
class PriceEntity with _$PriceEntity {
  const factory PriceEntity({
    required int value,
    @Default('₽') String currency,
  }) = _PriceEntity;

  factory PriceEntity.fromJson(Map<String, Object?> json) => _$PriceEntityFromJson(json);
}
