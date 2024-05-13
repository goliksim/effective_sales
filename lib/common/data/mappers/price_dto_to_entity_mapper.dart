import 'package:effective_sales/common/data/models/price_dto.dart';
import 'package:effective_sales/common/domain/models/price_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class PriceDtoToEntityMapper {
  PriceEntity map(PriceDto dto) {
    if (dto.value == null || dto.currency == null) {
      throw Exception('PriceMappper: dto has null params');
    }
    return PriceEntity(
      value: dto.value ?? 0,
      currency: dto.currency ?? '₽',
    );
  }
}

/*
@injectable
class FlightOfferDtoToEntityMapper {
  FlightOfferEntity map(FlightOfferDto dto) {
    if (dto.id == null || dto.title == null || dto.town == null || dto.price == null) {
      throw Exception('FlightOfferMappper: dto has null params');
    }
    return FlightOfferEntity(
      id: dto.id ?? -1,
      //TODO MOCK IMAGES
      imageUrl: 'assets/images/mock/offers/${dto.id ?? -1}.png',
      title: dto.title ?? 'Error title',
      town: dto.town ?? 'Error town',
      price: dto.price ?? const PriceEntity(value: 0),
    );
  }

  List<FlightOfferEntity> mapList(List<FlightOfferDto> flightOfferDtos) {
    return flightOfferDtos.map((e) => map(e)).toList();
  }
}*/
