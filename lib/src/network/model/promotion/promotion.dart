import 'package:e_commerce/src/network/model/common/json_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion.freezed.dart';
part 'promotion.g.dart';

@freezed
class MPromotion with _$MPromotion {
  const MPromotion._();

  const factory MPromotion({
    required String id, // Id
    String? code, // Mã code
    String? descriptipn, // " Giảm giá 50% cho đơn hàng trên 500K"
    int? minOrderValue, // "Giá trị đơn hàng tối thiểu: 500"
    DateTime? expireDate, // "Ngày hết hạn"
    double? discountPercentageValue, // Phần trăm giảm
    int? discountFixedValue, // Giảm giá trị cứng: ví dụ giảm 200k
  }) = _MPromotion;

  factory MPromotion.fromJson(JsonMap json) => _$MPromotionFromJson(json);

  int get remainDays => expireDate!.difference(DateTime.now()).inDays;

  bool get isValid => remainDays > 0;
}
