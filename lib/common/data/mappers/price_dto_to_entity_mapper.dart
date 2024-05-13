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
