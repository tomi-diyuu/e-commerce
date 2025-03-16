import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/network/firebase/base_collection.dart';
import 'package:e_commerce/src/network/model/common/result.dart';

import 'package:e_commerce/src/network/model/promotion/promotion.dart';

class PromotionReference extends BaseCollectionReference<MPromotion> {
  PromotionReference()
      : super(
          FirebaseFirestore.instance
              .collection('promotions')
              .withConverter<MPromotion>(
                fromFirestore: (snapshot, options) => MPromotion.fromJson(
                    snapshot.data() as Map<String, dynamic>),
                toFirestore: (e, _) => e.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  Future<MResult<MPromotion>> getOrAddPromotion(MPromotion promotion) async {
    try {
      final result = await get(promotion.id);
      if (result.isError == false) {
        return result;
      } else {
        final MResult<MPromotion> newResult =
            await set(promotion.copyWith(id: ref.doc().id)); // update id
        return MResult.success(newResult.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MPromotion>>> getPromotions() async {
    return await getAll();
  }
}
