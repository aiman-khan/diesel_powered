// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestUserEntityImpl _$$RestUserEntityImplFromJson(Map<String, dynamic> json) =>
    _$RestUserEntityImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      img: json['img'] as String?,
    );

Map<String, dynamic> _$$RestUserEntityImplToJson(
        _$RestUserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'img': instance.img,
    };
