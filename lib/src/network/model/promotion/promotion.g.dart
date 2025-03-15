// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MPromotionImpl _$$MPromotionImplFromJson(Map<String, dynamic> json) =>
    _$MPromotionImpl(
      id: json['id'] as String,
      code: json['code'] as String?,
      descriptipn: json['descriptipn'] as String?,
      minOrderValue: (json['minOrderValue'] as num?)?.toInt(),
      expireDate: json['expireDate'] == null
          ? null
          : DateTime.parse(json['expireDate'] as String),
      discountPercentageValue:
          (json['discountPercentageValue'] as num?)?.toDouble(),
      discountFixedValue: (json['discountFixedValue'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MPromotionImplToJson(_$MPromotionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'descriptipn': instance.descriptipn,
      'minOrderValue': instance.minOrderValue,
      'expireDate': instance.expireDate?.toIso8601String(),
      'discountPercentageValue': instance.discountPercentageValue,
      'discountFixedValue': instance.discountFixedValue,
    };
