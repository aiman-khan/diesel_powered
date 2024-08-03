import 'package:diesel_powered/features/about/domain/models/faq/faq_entity.dart';

class FaqModel {
  final String question;
  final String answer;

  FaqModel({
    required this.question,
    required this.answer,
  });

  factory FaqModel.fromEntity(FaqEntity entity) {
    return FaqModel(
      question: entity.question,
      answer: entity.answer,
    );
  }
}
