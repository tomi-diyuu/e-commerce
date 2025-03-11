// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MProduct _$MProductFromJson(Map<String, dynamic> json) {
  return _MProduct.fromJson(json);
}

/// @nodoc
mixin _$MProduct {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get descriptipn => throw _privateConstructorUsedError;
  int? get oldPrice => throw _privateConstructorUsedError;
  int? get newPrice => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  double? get avgRating => throw _privateConstructorUsedError;
  int get numbOfRating => throw _privateConstructorUsedError;
  bool get isNew => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  String? get idCategory => throw _privateConstructorUsedError;
  List<MVariant>? get variants => throw _privateConstructorUsedError;

  /// Serializes this MProduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MProductCopyWith<MProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MProductCopyWith<$Res> {
  factory $MProductCopyWith(MProduct value, $Res Function(MProduct) then) =
      _$MProductCopyWithImpl<$Res, MProduct>;
  @useResult
  $Res call(
      {String id,
      String? name,
      String? descriptipn,
      int? oldPrice,
      int? newPrice,
      String? image,
      double? avgRating,
      int numbOfRating,
      bool isNew,
      bool isFeatured,
      double discount,
      String? idCategory,
      List<MVariant>? variants});
}

/// @nodoc
class _$MProductCopyWithImpl<$Res, $Val extends MProduct>
    implements $MProductCopyWith<$Res> {
  _$MProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? descriptipn = freezed,
    Object? oldPrice = freezed,
    Object? newPrice = freezed,
    Object? image = freezed,
    Object? avgRating = freezed,
    Object? numbOfRating = null,
    Object? isNew = null,
    Object? isFeatured = null,
    Object? discount = null,
    Object? idCategory = freezed,
    Object? variants = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptipn: freezed == descriptipn
          ? _value.descriptipn
          : descriptipn // ignore: cast_nullable_to_non_nullable
              as String?,
      oldPrice: freezed == oldPrice
          ? _value.oldPrice
          : oldPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      newPrice: freezed == newPrice
          ? _value.newPrice
          : newPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      avgRating: freezed == avgRating
          ? _value.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double?,
      numbOfRating: null == numbOfRating
          ? _value.numbOfRating
          : numbOfRating // ignore: cast_nullable_to_non_nullable
              as int,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      idCategory: freezed == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      variants: freezed == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<MVariant>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MProductImplCopyWith<$Res>
    implements $MProductCopyWith<$Res> {
  factory _$$MProductImplCopyWith(
          _$MProductImpl value, $Res Function(_$MProductImpl) then) =
      __$$MProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? name,
      String? descriptipn,
      int? oldPrice,
      int? newPrice,
      String? image,
      double? avgRating,
      int numbOfRating,
      bool isNew,
      bool isFeatured,
      double discount,
      String? idCategory,
      List<MVariant>? variants});
}

/// @nodoc
class __$$MProductImplCopyWithImpl<$Res>
    extends _$MProductCopyWithImpl<$Res, _$MProductImpl>
    implements _$$MProductImplCopyWith<$Res> {
  __$$MProductImplCopyWithImpl(
      _$MProductImpl _value, $Res Function(_$MProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of MProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? descriptipn = freezed,
    Object? oldPrice = freezed,
    Object? newPrice = freezed,
    Object? image = freezed,
    Object? avgRating = freezed,
    Object? numbOfRating = null,
    Object? isNew = null,
    Object? isFeatured = null,
    Object? discount = null,
    Object? idCategory = freezed,
    Object? variants = freezed,
  }) {
    return _then(_$MProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptipn: freezed == descriptipn
          ? _value.descriptipn
          : descriptipn // ignore: cast_nullable_to_non_nullable
              as String?,
      oldPrice: freezed == oldPrice
          ? _value.oldPrice
          : oldPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      newPrice: freezed == newPrice
          ? _value.newPrice
          : newPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      avgRating: freezed == avgRating
          ? _value.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double?,
      numbOfRating: null == numbOfRating
          ? _value.numbOfRating
          : numbOfRating // ignore: cast_nullable_to_non_nullable
              as int,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      idCategory: freezed == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      variants: freezed == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<MVariant>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MProductImpl extends _MProduct {
  const _$MProductImpl(
      {required this.id,
      this.name,
      this.descriptipn,
      this.oldPrice,
      this.newPrice,
      this.image,
      this.avgRating,
      this.numbOfRating = 0,
      this.isNew = false,
      this.isFeatured = false,
      this.discount = 0,
      this.idCategory,
      final List<MVariant>? variants})
      : _variants = variants,
        super._();

  factory _$MProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$MProductImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? descriptipn;
  @override
  final int? oldPrice;
  @override
  final int? newPrice;
  @override
  final String? image;
  @override
  final double? avgRating;
  @override
  @JsonKey()
  final int numbOfRating;
  @override
  @JsonKey()
  final bool isNew;
  @override
  @JsonKey()
  final bool isFeatured;
  @override
  @JsonKey()
  final double discount;
  @override
  final String? idCategory;
  final List<MVariant>? _variants;
  @override
  List<MVariant>? get variants {
    final value = _variants;
    if (value == null) return null;
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MProduct(id: $id, name: $name, descriptipn: $descriptipn, oldPrice: $oldPrice, newPrice: $newPrice, image: $image, avgRating: $avgRating, numbOfRating: $numbOfRating, isNew: $isNew, isFeatured: $isFeatured, discount: $discount, idCategory: $idCategory, variants: $variants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.descriptipn, descriptipn) ||
                other.descriptipn == descriptipn) &&
            (identical(other.oldPrice, oldPrice) ||
                other.oldPrice == oldPrice) &&
            (identical(other.newPrice, newPrice) ||
                other.newPrice == newPrice) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.avgRating, avgRating) ||
                other.avgRating == avgRating) &&
            (identical(other.numbOfRating, numbOfRating) ||
                other.numbOfRating == numbOfRating) &&
            (identical(other.isNew, isNew) || other.isNew == isNew) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            const DeepCollectionEquality().equals(other._variants, _variants));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      descriptipn,
      oldPrice,
      newPrice,
      image,
      avgRating,
      numbOfRating,
      isNew,
      isFeatured,
      discount,
      idCategory,
      const DeepCollectionEquality().hash(_variants));

  /// Create a copy of MProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MProductImplCopyWith<_$MProductImpl> get copyWith =>
      __$$MProductImplCopyWithImpl<_$MProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MProductImplToJson(
      this,
    );
  }
}

abstract class _MProduct extends MProduct {
  const factory _MProduct(
      {required final String id,
      final String? name,
      final String? descriptipn,
      final int? oldPrice,
      final int? newPrice,
      final String? image,
      final double? avgRating,
      final int numbOfRating,
      final bool isNew,
      final bool isFeatured,
      final double discount,
      final String? idCategory,
      final List<MVariant>? variants}) = _$MProductImpl;
  const _MProduct._() : super._();

  factory _MProduct.fromJson(Map<String, dynamic> json) =
      _$MProductImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get descriptipn;
  @override
  int? get oldPrice;
  @override
  int? get newPrice;
  @override
  String? get image;
  @override
  double? get avgRating;
  @override
  int get numbOfRating;
  @override
  bool get isNew;
  @override
  bool get isFeatured;
  @override
  double get discount;
  @override
  String? get idCategory;
  @override
  List<MVariant>? get variants;

  /// Create a copy of MProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MProductImplCopyWith<_$MProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
