// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MCategory _$MCategoryFromJson(Map<String, dynamic> json) {
  return _MCategory.fromJson(json);
}

/// @nodoc
mixin _$MCategory {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this MCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MCategoryCopyWith<MCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MCategoryCopyWith<$Res> {
  factory $MCategoryCopyWith(MCategory value, $Res Function(MCategory) then) =
      _$MCategoryCopyWithImpl<$Res, MCategory>;
  @useResult
  $Res call({String id, String? name});
}

/// @nodoc
class _$MCategoryCopyWithImpl<$Res, $Val extends MCategory>
    implements $MCategoryCopyWith<$Res> {
  _$MCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MCategoryImplCopyWith<$Res>
    implements $MCategoryCopyWith<$Res> {
  factory _$$MCategoryImplCopyWith(
          _$MCategoryImpl value, $Res Function(_$MCategoryImpl) then) =
      __$$MCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? name});
}

/// @nodoc
class __$$MCategoryImplCopyWithImpl<$Res>
    extends _$MCategoryCopyWithImpl<$Res, _$MCategoryImpl>
    implements _$$MCategoryImplCopyWith<$Res> {
  __$$MCategoryImplCopyWithImpl(
      _$MCategoryImpl _value, $Res Function(_$MCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of MCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
  }) {
    return _then(_$MCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MCategoryImpl implements _MCategory {
  const _$MCategoryImpl({required this.id, this.name});

  factory _$MCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MCategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;

  @override
  String toString() {
    return 'MCategory(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of MCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MCategoryImplCopyWith<_$MCategoryImpl> get copyWith =>
      __$$MCategoryImplCopyWithImpl<_$MCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MCategoryImplToJson(
      this,
    );
  }
}

abstract class _MCategory implements MCategory {
  const factory _MCategory({required final String id, final String? name}) =
      _$MCategoryImpl;

  factory _MCategory.fromJson(Map<String, dynamic> json) =
      _$MCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;

  /// Create a copy of MCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MCategoryImplCopyWith<_$MCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
