// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rest_content_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestContentEntity _$RestContentEntityFromJson(Map<String, dynamic> json) {
  return _RestContentEntity.fromJson(json);
}

/// @nodoc
mixin _$RestContentEntity {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get last_updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestContentEntityCopyWith<RestContentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestContentEntityCopyWith<$Res> {
  factory $RestContentEntityCopyWith(
          RestContentEntity value, $Res Function(RestContentEntity) then) =
      _$RestContentEntityCopyWithImpl<$Res, RestContentEntity>;
  @useResult
  $Res call({String title, String content, String last_updated});
}

/// @nodoc
class _$RestContentEntityCopyWithImpl<$Res, $Val extends RestContentEntity>
    implements $RestContentEntityCopyWith<$Res> {
  _$RestContentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? last_updated = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      last_updated: null == last_updated
          ? _value.last_updated
          : last_updated // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestContentEntityImplCopyWith<$Res>
    implements $RestContentEntityCopyWith<$Res> {
  factory _$$RestContentEntityImplCopyWith(_$RestContentEntityImpl value,
          $Res Function(_$RestContentEntityImpl) then) =
      __$$RestContentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content, String last_updated});
}

/// @nodoc
class __$$RestContentEntityImplCopyWithImpl<$Res>
    extends _$RestContentEntityCopyWithImpl<$Res, _$RestContentEntityImpl>
    implements _$$RestContentEntityImplCopyWith<$Res> {
  __$$RestContentEntityImplCopyWithImpl(_$RestContentEntityImpl _value,
      $Res Function(_$RestContentEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? last_updated = null,
  }) {
    return _then(_$RestContentEntityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      last_updated: null == last_updated
          ? _value.last_updated
          : last_updated // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestContentEntityImpl implements _RestContentEntity {
  const _$RestContentEntityImpl(
      {required this.title, required this.content, required this.last_updated});

  factory _$RestContentEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestContentEntityImplFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final String last_updated;

  @override
  String toString() {
    return 'RestContentEntity(title: $title, content: $content, last_updated: $last_updated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestContentEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.last_updated, last_updated) ||
                other.last_updated == last_updated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, last_updated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestContentEntityImplCopyWith<_$RestContentEntityImpl> get copyWith =>
      __$$RestContentEntityImplCopyWithImpl<_$RestContentEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestContentEntityImplToJson(
      this,
    );
  }
}

abstract class _RestContentEntity implements RestContentEntity {
  const factory _RestContentEntity(
      {required final String title,
      required final String content,
      required final String last_updated}) = _$RestContentEntityImpl;

  factory _RestContentEntity.fromJson(Map<String, dynamic> json) =
      _$RestContentEntityImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  String get last_updated;
  @override
  @JsonKey(ignore: true)
  _$$RestContentEntityImplCopyWith<_$RestContentEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
