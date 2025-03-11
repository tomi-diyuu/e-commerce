import 'package:e_commerce/src/network/model/common/json_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'variant.freezed.dart';
part 'variant.g.dart';

@freezed
class MVariant with _$MVariant {
  const MVariant._();

  const factory MVariant(
      {required String id,
      String? color,
      String? size,
      int? price,
      String? image}) = _MVariant;

  factory MVariant.fromJson(JsonMap json) => _$MVariantFromJson(json);

 
}
