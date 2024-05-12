import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'arrival_recommendation_entity.freezed.dart';
part 'arrival_recommendation_entity.g.dart';

@freezed
class ArrivalRecommendationEntity with _$ArrivalRecommendationEntity {
  const factory ArrivalRecommendationEntity({
    required String placeTitle,
    required String imageUrl,
    required String tag,
    //timezone ...
  }) = _ArrivalRecommendationEntity;

  factory ArrivalRecommendationEntity.fromJson(Map<String, Object?> json) =>
      _$ArrivalRecommendationEntityFromJson(json);
}
