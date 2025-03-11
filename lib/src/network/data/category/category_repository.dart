import 'package:e_commerce/src/network/model/category/category.dart';
import 'package:e_commerce/src/network/model/common/result.dart';

abstract class CategoryRepository {
  Future<MResult<List<MCategory>>> getCategories();

  Future<MResult<MCategory>> getOrAddCategories(MCategory category);
}
