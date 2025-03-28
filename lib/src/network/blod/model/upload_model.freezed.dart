// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MUpload _$MUploadFromJson(Map<String, dynamic> json) {
  return _MUpload.fromJson(json);
}

/// @nodoc
mixin _$MUpload {
  @JsonKey(name: "secure_url")
  String get url => throw _privateConstructorUsedError;

  /// Serializes this MUpload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MUpload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MUploadCopyWith<MUpload> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MUploadCopyWith<$Res> {
  factory $MUploadCopyWith(MUpload value, $Res Function(MUpload) then) =
      _$MUploadCopyWithImpl<$Res, MUpload>;
  @useResult
  $Res call({@JsonKey(name: "secure_url") String url});
}

/// @nodoc
class _$MUploadCopyWithImpl<$Res, $Val extends MUpload>
    implements $MUploadCopyWith<$Res> {
  _$MUploadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MUpload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MUploadImplCopyWith<$Res> implements $MUploadCopyWith<$Res> {
  factory _$$MUploadImplCopyWith(
          _$MUploadImpl value, $Res Function(_$MUploadImpl) then) =
      __$$MUploadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "secure_url") String url});
}

/// @nodoc
class __$$MUploadImplCopyWithImpl<$Res>
    extends _$MUploadCopyWithImpl<$Res, _$MUploadImpl>
    implements _$$MUploadImplCopyWith<$Res> {
  __$$MUploadImplCopyWithImpl(
      _$MUploadImpl _value, $Res Function(_$MUploadImpl) _then)
      : super(_value, _then);

  /// Create a copy of MUpload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$MUploadImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MUploadImpl with DiagnosticableTreeMixin implements _MUpload {
  const _$MUploadImpl({@JsonKey(name: "secure_url") required this.url});

  factory _$MUploadImpl.fromJson(Map<String, dynamic> json) =>
      _$$MUploadImplFromJson(json);

  @override
  @JsonKey(name: "secure_url")
  final String url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MUpload(url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MUpload'))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MUploadImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of MUpload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MUploadImplCopyWith<_$MUploadImpl> get copyWith =>
      __$$MUploadImplCopyWithImpl<_$MUploadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MUploadImplToJson(
      this,
    );
  }
}

abstract class _MUpload implements MUpload {
  const factory _MUpload(
      {@JsonKey(name: "secure_url") required final String url}) = _$MUploadImpl;

  factory _MUpload.fromJson(Map<String, dynamic> json) = _$MUploadImpl.fromJson;

  @override
  @JsonKey(name: "secure_url")
  String get url;

  /// Create a copy of MUpload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MUploadImplCopyWith<_$MUploadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
