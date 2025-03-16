import 'package:e_commerce/src/network/model/common/result.dart';
import 'package:e_commerce/src/network/model/promotion/promotion.dart';

abstract class PromotionRepository {
  Future<MResult<MPromotion>> getOrAddPromotion(MPromotion promotion);

  Future<MResult<List<MPromotion>>> getPromotions();
}
