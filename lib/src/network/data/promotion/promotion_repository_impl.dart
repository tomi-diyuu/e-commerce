import 'package:e_commerce/src/network/data/promotion/promotion_reference.dart';
import 'package:e_commerce/src/network/data/promotion/promotion_repository.dart';
import 'package:e_commerce/src/network/model/common/result.dart';
import 'package:e_commerce/src/network/model/promotion/promotion.dart';

class PromotionRepositoryImpl implements PromotionRepository {
  final promoRef = PromotionReference();
  @override
  Future<MResult<MPromotion>> getOrAddPromotion(MPromotion promotion) {
    return promoRef.getOrAddPromotion(promotion);
  }

  @override
  Future<MResult<List<MPromotion>>> getPromotions() async {
    return await promoRef.getPromotions();
  }
}
