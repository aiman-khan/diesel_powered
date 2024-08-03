// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rest_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestUserEntity _$RestUserEntityFromJson(Map<String, dynamic> json) {
  return _RestUserEntity.fromJson(json);
}

/// @nodoc
mixin _$RestUserEntity {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get img => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestUserEntityCopyWith<RestUserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestUserEntityCopyWith<$Res> {
  factory $RestUserEntityCopyWith(
          RestUserEntity value, $Res Function(RestUserEntity) then) =
      _$RestUserEntityCopyWithImpl<$Res, RestUserEntity>;
  @useResult
  $Res call({int id, String email, String name, String phone, String? img});
}

/// @nodoc
class _$RestUserEntityCopyWithImpl<$Res, $Val extends RestUserEntity>
    implements $RestUserEntityCopyWith<$Res> {
  _$RestUserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? phone = null,
    Object? img = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestUserEntityImplCopyWith<$Res>
    implements $RestUserEntityCopyWith<$Res> {
  factory _$$RestUserEntityImplCopyWith(_$RestUserEntityImpl value,
          $Res Function(_$RestUserEntityImpl) then) =
      __$$RestUserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String email, String name, String phone, String? img});
}

/// @nodoc
class __$$RestUserEntityImplCopyWithImpl<$Res>
    extends _$RestUserEntityCopyWithImpl<$Res, _$RestUserEntityImpl>
    implements _$$RestUserEntityImplCopyWith<$Res> {
  __$$RestUserEntityImplCopyWithImpl(
      _$RestUserEntityImpl _value, $Res Function(_$RestUserEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? phone = null,
    Object? img = freezed,
  }) {
    return _then(_$RestUserEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestUserEntityImpl implements _RestUserEntity {
  const _$RestUserEntityImpl(
      {required this.id,
      required this.email,
      required this.name,
      required this.phone,
      required this.img});

  factory _$RestUserEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestUserEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String? img;

  @override
  String toString() {
    return 'RestUserEntity(id: $id, email: $email, name: $name, phone: $phone, img: $img)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestUserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.img, img) || other.img == img));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, name, phone, img);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestUserEntityImplCopyWith<_$RestUserEntityImpl> get copyWith =>
      __$$RestUserEntityImplCopyWithImpl<_$RestUserEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestUserEntityImplToJson(
      this,
    );
  }
}

abstract class _RestUserEntity implements RestUserEntity {
  const factory _RestUserEntity(
      {required final int id,
      required final String email,
      required final String name,
      required final String phone,
      required final String? img}) = _$RestUserEntityImpl;

  factory _RestUserEntity.fromJson(Map<String, dynamic> json) =
      _$RestUserEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get name;
  @override
  String get phone;
  @override
  String? get img;
  @override
  @JsonKey(ignore: true)
  _$$RestUserEntityImplCopyWith<_$RestUserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
