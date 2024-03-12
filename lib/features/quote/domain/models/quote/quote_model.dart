import 'package:calculator_flutter_app/features/quote/domain/models/quote/quote_entity.dart';

class QuoteModel {
  final String content;
  final String author;

  QuoteModel({
    required this.content,
    required this.author,
  });

  factory QuoteModel.fromEntity(QuoteEntity entity) {
    return QuoteModel(
      content: entity.content,
      author: entity.author,
    );
  }
}
