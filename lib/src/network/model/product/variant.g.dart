// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MVariantImpl _$$MVariantImplFromJson(Map<String, dynamic> json) =>
    _$MVariantImpl(
      id: json['id'] as String,
      color: json['color'] as String?,
      size: json['size'] as String?,
      price: (json['price'] as num?)?.toInt(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$MVariantImplToJson(_$MVariantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
      'size': instance.size,
      'price': instance.price,
      'image': instance.image,
    };
