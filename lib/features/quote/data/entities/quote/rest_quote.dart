import 'package:diesel_powered/features/quote/domain/models/quote/quote_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_quote.freezed.dart';
part 'rest_quote.g.dart';

@freezed
class RestQuoteEntity extends QuoteEntity with _$RestQuoteEntity {
  const factory RestQuoteEntity({
    required String content,
    required String author,
  }) = _RestQuoteEntity;

  factory RestQuoteEntity.fromJson(Map<String, Object?> json) =>
      _$RestQuoteEntityFromJson(json);
}
