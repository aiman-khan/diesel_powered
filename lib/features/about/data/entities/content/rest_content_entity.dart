import 'package:calculator_flutter_app/features/about/domain/models/about/content_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_content_entity.freezed.dart';
part 'rest_content_entity.g.dart';

@freezed
class RestContentEntity extends ContentEntity with _$RestContentEntity {
  const factory RestContentEntity({
    required String title,
    required String content,
    required String last_updated,
  }) = _RestContentEntity;

  factory RestContentEntity.fromJson(Map<String, Object?> json) =>
      _$RestContentEntityFromJson(json);
}
