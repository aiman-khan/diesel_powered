import 'package:calculator_flutter_app/features/about/domain/models/faq/faq_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_faq_entity.freezed.dart';
part 'rest_faq_entity.g.dart';

@freezed
class RestFaqEntity extends FaqEntity with _$RestFaqEntity {
  const factory RestFaqEntity({
    required String question,
    required String answer,
  }) = _RestFaqEntity;

  factory RestFaqEntity.fromJson(Map<String, Object?> json) =>
      _$RestFaqEntityFromJson(json);
}
