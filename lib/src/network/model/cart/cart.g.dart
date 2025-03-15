// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MCartImpl _$$MCartImplFromJson(Map<String, dynamic> json) => _$MCartImpl(
      userId: json['userId'] as String,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => MCartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalPrice: (json['totalPrice'] as num?)?.toInt() ?? 0,
      promo: (json['promo'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MCartImplToJson(_$MCartImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'totalPrice': instance.totalPrice,
      'promo': instance.promo,
    };
