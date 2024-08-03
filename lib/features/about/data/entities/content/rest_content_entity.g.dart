// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_content_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestContentEntityImpl _$$RestContentEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$RestContentEntityImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      last_updated: json['last_updated'] as String,
    );

Map<String, dynamic> _$$RestContentEntityImplToJson(
        _$RestContentEntityImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'last_updated': instance.last_updated,
    };
