import 'package:diesel_powered/features/quote/data/entities/photo_url/rest_photo_url.dart';
import 'package:diesel_powered/features/quote/domain/models/photo/photo_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_photo.freezed.dart';
part 'rest_photo.g.dart';

@freezed
class RestPhotoEntity extends PhotoEntity with _$RestPhotoEntity {
  const factory RestPhotoEntity({
    required RestPhotoUrlEntity? urls,
  }) = _RestPhotoEntity;

  factory RestPhotoEntity.fromJson(Map<String, Object?> json) =>
      _$RestPhotoEntityFromJson(json);
}
