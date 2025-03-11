// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MCartItem _$MCartItemFromJson(Map<String, dynamic> json) {
  return _MCartItem.fromJson(json);
}

/// @nodoc
mixin _$MCartItem {
  String get id => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;

  /// Serializes this MCartItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MCartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MCartItemCopyWith<MCartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MCartItemCopyWith<$Res> {
  factory $MCartItemCopyWith(MCartItem value, $Res Function(MCartItem) then) =
      _$MCartItemCopyWithImpl<$Res, MCartItem>;
  @useResult
  $Res call(
      {String id,
      String productId,
      String name,
      int price,
      String color,
      String size,
      String image,
      int quantity,
      int totalPrice});
}

/// @nodoc
class _$MCartItemCopyWithImpl<$Res, $Val extends MCartItem>
    implements $MCartItemCopyWith<$Res> {
  _$MCartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MCartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? color = null,
    Object? size = null,
    Object? image = null,
    Object? quantity = null,
    Object? totalPrice = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MCartItemImplCopyWith<$Res>
    implements $MCartItemCopyWith<$Res> {
  factory _$$MCartItemImplCopyWith(
          _$MCartItemImpl value, $Res Function(_$MCartItemImpl) then) =
      __$$MCartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String productId,
      String name,
      int price,
      String color,
      String size,
      String image,
      int quantity,
      int totalPrice});
}

/// @nodoc
class __$$MCartItemImplCopyWithImpl<$Res>
    extends _$MCartItemCopyWithImpl<$Res, _$MCartItemImpl>
    implements _$$MCartItemImplCopyWith<$Res> {
  __$$MCartItemImplCopyWithImpl(
      _$MCartItemImpl _value, $Res Function(_$MCartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of MCartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? color = null,
    Object? size = null,
    Object? image = null,
    Object? quantity = null,
    Object? totalPrice = null,
  }) {
    return _then(_$MCartItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MCartItemImpl extends _MCartItem {
  const _$MCartItemImpl(
      {required this.id,
      required this.productId,
      required this.name,
      required this.price,
      required this.color,
      required this.size,
      required this.image,
      this.quantity = 1,
      this.totalPrice = 0})
      : super._();

  factory _$MCartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MCartItemImplFromJson(json);

  @override
  final String id;
  @override
  final String productId;
  @override
  final String name;
  @override
  final int price;
  @override
  final String color;
  @override
  final String size;
  @override
  final String image;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final int totalPrice;

  @override
  String toString() {
    return 'MCartItem(id: $id, productId: $productId, name: $name, price: $price, color: $color, size: $size, image: $image, quantity: $quantity, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MCartItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productId, name, price,
      color, size, image, quantity, totalPrice);

  /// Create a copy of MCartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MCartItemImplCopyWith<_$MCartItemImpl> get copyWith =>
      __$$MCartItemImplCopyWithImpl<_$MCartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MCartItemImplToJson(
      this,
    );
  }
}

abstract class _MCartItem extends MCartItem {
  const factory _MCartItem(
      {required final String id,
      required final String productId,
      required final String name,
      required final int price,
      required final String color,
      required final String size,
      required final String image,
      final int quantity,
      final int totalPrice}) = _$MCartItemImpl;
  const _MCartItem._() : super._();

  factory _MCartItem.fromJson(Map<String, dynamic> json) =
      _$MCartItemImpl.fromJson;

  @override
  String get id;
  @override
  String get productId;
  @override
  String get name;
  @override
  int get price;
  @override
  String get color;
  @override
  String get size;
  @override
  String get image;
  @override
  int get quantity;
  @override
  int get totalPrice;

  /// Create a copy of MCartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MCartItemImplCopyWith<_$MCartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
