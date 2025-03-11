import 'package:e_commerce/src/network/model/common/json_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class MCategory with _$MCategory {
  const factory MCategory({
    required String id,
    String? name,
  }) = _MCategory;

  factory MCategory.fromJson(JsonMap json) => _$MCategoryFromJson(json);
}
