// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MProductImpl _$$MProductImplFromJson(Map<String, dynamic> json) =>
    _$MProductImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      descriptipn: json['descriptipn'] as String?,
      oldPrice: (json['oldPrice'] as num?)?.toInt(),
      newPrice: (json['newPrice'] as num?)?.toInt(),
      image: json['image'] as String?,
      avgRating: (json['avgRating'] as num?)?.toDouble(),
      numbOfRating: (json['numbOfRating'] as num?)?.toInt() ?? 0,
      isNew: json['isNew'] as bool? ?? false,
      isFeatured: json['isFeatured'] as bool? ?? false,
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
      idCategory: json['idCategory'] as String?,
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => MVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MProductImplToJson(_$MProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'descriptipn': instance.descriptipn,
      'oldPrice': instance.oldPrice,
      'newPrice': instance.newPrice,
      'image': instance.image,
      'avgRating': instance.avgRating,
      'numbOfRating': instance.numbOfRating,
      'isNew': instance.isNew,
      'isFeatured': instance.isFeatured,
      'discount': instance.discount,
      'idCategory': instance.idCategory,
      'variants': instance.variants?.map((e) => e.toJson()).toList(),
    };
