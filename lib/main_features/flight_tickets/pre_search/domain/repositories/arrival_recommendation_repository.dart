import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/models/arrival_recommendation_entity.dart';

abstract interface class ArrivalRecommendationRepository {
  Future<List<ArrivalRecommendationEntity>> getAllRecommendation();
}
