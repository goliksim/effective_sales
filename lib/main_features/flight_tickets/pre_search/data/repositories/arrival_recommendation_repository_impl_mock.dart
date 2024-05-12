import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/models/arrival_recommendation_entity.dart';
import 'package:effective_sales/main_features/flight_tickets/pre_search/domain/repositories/arrival_recommendation_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ArrivalRecommendationRepositoryImplMock implements ArrivalRecommendationRepository {
  //final NetworkArrivalRecommendationRepository datasource;

  ArrivalRecommendationRepositoryImplMock(
      //this.datasource
      );

  @override
  Future<List<ArrivalRecommendationEntity>> getAllRecommendation() {
    return Future.value(_recommendation);
  }

  static const List<ArrivalRecommendationEntity> _recommendation = [
    ArrivalRecommendationEntity(
      placeTitle: 'Стамбул',
      imageUrl: 'assets/images/mock/arrival_recommendation/istanbul.png',
      tag: 'Популярное направление',
    ),
    ArrivalRecommendationEntity(
      placeTitle: 'Сочи',
      imageUrl: 'assets/images/mock/arrival_recommendation/sochi.png',
      tag: 'Популярное направление',
    ),
    ArrivalRecommendationEntity(
      placeTitle: 'Пхукет',
      imageUrl: 'assets/images/mock/arrival_recommendation/phuket.png',
      tag: 'Популярное направление',
    ),
    ArrivalRecommendationEntity(
      placeTitle: 'Стамбул',
      imageUrl: 'assets/images/mock/arrival_recommendation/istanbul.png',
      tag: 'Популярное направление',
    ),
    ArrivalRecommendationEntity(
      placeTitle: 'Сочи',
      imageUrl: 'assets/images/mock/arrival_recommendation/sochi.png',
      tag: 'Популярное направление',
    ),
    ArrivalRecommendationEntity(
      placeTitle: 'Пхукет',
      imageUrl: 'assets/images/mock/arrival_recommendation/phuket.png',
      tag: 'Популярное направление',
    ),
    ArrivalRecommendationEntity(
      placeTitle: 'Стамбул',
      imageUrl: 'assets/images/mock/arrival_recommendation/istanbul.png',
      tag: 'Популярное направление',
    ),
    ArrivalRecommendationEntity(
      placeTitle: 'Сочи',
      imageUrl: 'assets/images/mock/arrival_recommendation/sochi.png',
      tag: 'Популярное направление',
    ),
    ArrivalRecommendationEntity(
      placeTitle: 'Пхукет',
      imageUrl: 'assets/images/mock/arrival_recommendation/phuket.png',
      tag: 'Популярное направление',
    ),
    ArrivalRecommendationEntity(
      placeTitle: 'Стамбул',
      imageUrl: 'assets/images/mock/arrival_recommendation/istanbul.png',
      tag: 'Популярное направление',
    ),
    ArrivalRecommendationEntity(
      placeTitle: 'Сочи',
      imageUrl: 'assets/images/mock/arrival_recommendation/sochi.png',
      tag: 'Популярное направление',
    ),
    ArrivalRecommendationEntity(
      placeTitle: 'Пхукет',
      imageUrl: 'assets/images/mock/arrival_recommendation/phuket.png',
      tag: 'Популярное направление',
    ),
    ArrivalRecommendationEntity(
      placeTitle: 'Стамбул',
      imageUrl: 'assets/images/mock/arrival_recommendation/istanbul.png',
      tag: 'Популярное направление',
    ),
    ArrivalRecommendationEntity(
      placeTitle: 'Сочи',
      imageUrl: 'assets/images/mock/arrival_recommendation/sochi.png',
      tag: 'Популярное направление',
    ),
    ArrivalRecommendationEntity(
      placeTitle: 'Пхукет',
      imageUrl: 'assets/images/mock/arrival_recommendation/phuket.png',
      tag: 'Популярное направление',
    ),
  ];
}
