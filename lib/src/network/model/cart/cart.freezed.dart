// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MCart _$MCartFromJson(Map<String, dynamic> json) {
  return _MCart.fromJson(json);
}

/// @nodoc
mixin _$MCart {
  String get userId => throw _privateConstructorUsedError;
  List<MCartItem> get items => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;

  /// Serializes this MCart to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MCart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MCartCopyWith<MCart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MCartCopyWith<$Res> {
  factory $MCartCopyWith(MCart value, $Res Function(MCart) then) =
      _$MCartCopyWithImpl<$Res, MCart>;
  @useResult
  $Res call({String userId, List<MCartItem> items, int totalPrice});
}

/// @nodoc
class _$MCartCopyWithImpl<$Res, $Val extends MCart>
    implements $MCartCopyWith<$Res> {
  _$MCartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MCart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? items = null,
    Object? totalPrice = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MCartItem>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MCartImplCopyWith<$Res> implements $MCartCopyWith<$Res> {
  factory _$$MCartImplCopyWith(
          _$MCartImpl value, $Res Function(_$MCartImpl) then) =
      __$$MCartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, List<MCartItem> items, int totalPrice});
}

/// @nodoc
class __$$MCartImplCopyWithImpl<$Res>
    extends _$MCartCopyWithImpl<$Res, _$MCartImpl>
    implements _$$MCartImplCopyWith<$Res> {
  __$$MCartImplCopyWithImpl(
      _$MCartImpl _value, $Res Function(_$MCartImpl) _then)
      : super(_value, _then);

  /// Create a copy of MCart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? items = null,
    Object? totalPrice = null,
  }) {
    return _then(_$MCartImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MCartItem>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MCartImpl extends _MCart {
  const _$MCartImpl(
      {required this.userId,
      final List<MCartItem> items = const [],
      this.totalPrice = 0})
      : _items = items,
        super._();

  factory _$MCartImpl.fromJson(Map<String, dynamic> json) =>
      _$$MCartImplFromJson(json);

  @override
  final String userId;
  final List<MCartItem> _items;
  @override
  @JsonKey()
  List<MCartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int totalPrice;

  @override
  String toString() {
    return 'MCart(userId: $userId, items: $items, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MCartImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId,
      const DeepCollectionEquality().hash(_items), totalPrice);

  /// Create a copy of MCart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MCartImplCopyWith<_$MCartImpl> get copyWith =>
      __$$MCartImplCopyWithImpl<_$MCartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MCartImplToJson(
      this,
    );
  }
}

abstract class _MCart extends MCart {
  const factory _MCart(
      {required final String userId,
      final List<MCartItem> items,
      final int totalPrice}) = _$MCartImpl;
  const _MCart._() : super._();

  factory _MCart.fromJson(Map<String, dynamic> json) = _$MCartImpl.fromJson;

  @override
  String get userId;
  @override
  List<MCartItem> get items;
  @override
  int get totalPrice;

  /// Create a copy of MCart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MCartImplCopyWith<_$MCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
