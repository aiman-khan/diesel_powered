import 'package:diesel_powered/features/about/domain/models/about/content_entity.dart';

class ContentModel {
  final String title;
  final String content;
  final String lastUpdated;

  ContentModel({
    required this.title,
    required this.content,
    required this.lastUpdated,
  });

  factory ContentModel.fromEntity(ContentEntity entity) {
    return ContentModel(
      title: entity.title,
      content: entity.content,
      lastUpdated: entity.last_updated,
    );
  }
}
