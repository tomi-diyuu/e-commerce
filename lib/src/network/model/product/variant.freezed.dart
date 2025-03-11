// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MVariant _$MVariantFromJson(Map<String, dynamic> json) {
  return _MVariant.fromJson(json);
}

/// @nodoc
mixin _$MVariant {
  String get id => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get size => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this MVariant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MVariant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MVariantCopyWith<MVariant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MVariantCopyWith<$Res> {
  factory $MVariantCopyWith(MVariant value, $Res Function(MVariant) then) =
      _$MVariantCopyWithImpl<$Res, MVariant>;
  @useResult
  $Res call(
      {String id, String? color, String? size, int? price, String? image});
}

/// @nodoc
class _$MVariantCopyWithImpl<$Res, $Val extends MVariant>
    implements $MVariantCopyWith<$Res> {
  _$MVariantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MVariant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? color = freezed,
    Object? size = freezed,
    Object? price = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MVariantImplCopyWith<$Res>
    implements $MVariantCopyWith<$Res> {
  factory _$$MVariantImplCopyWith(
          _$MVariantImpl value, $Res Function(_$MVariantImpl) then) =
      __$$MVariantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String? color, String? size, int? price, String? image});
}

/// @nodoc
class __$$MVariantImplCopyWithImpl<$Res>
    extends _$MVariantCopyWithImpl<$Res, _$MVariantImpl>
    implements _$$MVariantImplCopyWith<$Res> {
  __$$MVariantImplCopyWithImpl(
      _$MVariantImpl _value, $Res Function(_$MVariantImpl) _then)
      : super(_value, _then);

  /// Create a copy of MVariant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? color = freezed,
    Object? size = freezed,
    Object? price = freezed,
    Object? image = freezed,
  }) {
    return _then(_$MVariantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MVariantImpl extends _MVariant {
  const _$MVariantImpl(
      {required this.id, this.color, this.size, this.price, this.image})
      : super._();

  factory _$MVariantImpl.fromJson(Map<String, dynamic> json) =>
      _$$MVariantImplFromJson(json);

  @override
  final String id;
  @override
  final String? color;
  @override
  final String? size;
  @override
  final int? price;
  @override
  final String? image;

  @override
  String toString() {
    return 'MVariant(id: $id, color: $color, size: $size, price: $price, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MVariantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, color, size, price, image);

  /// Create a copy of MVariant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MVariantImplCopyWith<_$MVariantImpl> get copyWith =>
      __$$MVariantImplCopyWithImpl<_$MVariantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MVariantImplToJson(
      this,
    );
  }
}

abstract class _MVariant extends MVariant {
  const factory _MVariant(
      {required final String id,
      final String? color,
      final String? size,
      final int? price,
      final String? image}) = _$MVariantImpl;
  const _MVariant._() : super._();

  factory _MVariant.fromJson(Map<String, dynamic> json) =
      _$MVariantImpl.fromJson;

  @override
  String get id;
  @override
  String? get color;
  @override
  String? get size;
  @override
  int? get price;
  @override
  String? get image;

  /// Create a copy of MVariant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MVariantImplCopyWith<_$MVariantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
