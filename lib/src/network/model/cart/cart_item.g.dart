// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MCartItemImpl _$$MCartItemImplFromJson(Map<String, dynamic> json) =>
    _$MCartItemImpl(
      id: json['id'] as String,
      productId: json['productId'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      color: json['color'] as String,
      size: json['size'] as String,
      image: json['image'] as String,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      totalPrice: (json['totalPrice'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MCartItemImplToJson(_$MCartItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'name': instance.name,
      'price': instance.price,
      'color': instance.color,
      'size': instance.size,
      'image': instance.image,
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
    };
