import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/network/firebase/base_collection.dart';
import 'package:e_commerce/src/network/model/cart/cart.dart';
import 'package:e_commerce/src/network/model/common/json_map.dart';
import 'package:e_commerce/src/network/model/common/result.dart';

class CartReference extends BaseCollectionReference<MCart> {
  CartReference()
      : super(
            FirebaseFirestore.instance.collection('carts').withConverter(
                fromFirestore: (snapshot, options) =>
                    MCart.fromJson(snapshot.data() as JsonMap),
                toFirestore: (e, _) => e.toJson()),
            getObjectId: (e) => e.userId,
            setObjectId: (e, id) => e.copyWith(userId: id));

  Future<MResult<MCart>> getOrAddCart(MCart cart) async {
    try {
      final result = await get(cart.userId);
      if (result.isError == false) {
        return result;
      } else {
        final MResult<MCart> newCart =
            await set(cart.copyWith(userId: cart.userId));
        return MResult.success(newCart.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<MCart>> updateCart(MCart cart) async {
    try {
      final result = await set(cart);
      return MResult.success(result.data);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
