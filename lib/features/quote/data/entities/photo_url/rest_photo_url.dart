import 'package:calculator_flutter_app/features/quote/domain/models/photo_url/photo_url_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_photo_url.freezed.dart';
part 'rest_photo_url.g.dart';

@freezed
class RestPhotoUrlEntity extends PhotoUrlEntity with _$RestPhotoUrlEntity {
  const factory RestPhotoUrlEntity({
    required String raw,
    required String full,
    required String regular,
    required String small,
    required String thumb,
  }) = _RestPhotoUrlEntity;

  factory RestPhotoUrlEntity.fromJson(Map<String, Object?> json) =>
      _$RestPhotoUrlEntityFromJson(json);
}
