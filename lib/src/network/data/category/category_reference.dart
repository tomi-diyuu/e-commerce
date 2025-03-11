
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/network/firebase/base_collection.dart';
import 'package:e_commerce/src/network/model/category/category.dart';
import 'package:e_commerce/src/network/model/common/result.dart';

class CategoryReference extends BaseCollectionReference<MCategory> {
  CategoryReference()
      : super(
          FirebaseFirestore.instance
              .collection('categories')
              .withConverter<MCategory>(
                fromFirestore: (snapshot, options) =>
                    MCategory.fromJson(snapshot.data() as Map<String, dynamic>),
                toFirestore: (e, _) => e.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  Future<MResult<List<MCategory>>> getCategories() async {
    return await getAll();
  }

  Future<MResult<MCategory>> getOrAddCategory(MCategory category) async {
    try {
      final result = await get(category.id);
      if (result.isError == false) {
        return result;
      } else {
        final MResult<MCategory> newResult =
            await set(category.copyWith(id: ref.doc().id)); // update id
        return MResult.success(newResult.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
