import 'package:e_commerce/src/network/data/category/category_reference.dart';
import 'package:e_commerce/src/network/data/category/category_repository.dart';

import 'package:e_commerce/src/network/model/category/category.dart';
import 'package:e_commerce/src/network/model/common/result.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final categoryRef = CategoryReference();

  @override
  Future<MResult<List<MCategory>>> getCategories() async {
    return await categoryRef.getCategories();
  }

  @override
  Future<MResult<MCategory>> getOrAddCategories(MCategory category) async {
    return await categoryRef.getOrAddCategory(category);
  }
}
