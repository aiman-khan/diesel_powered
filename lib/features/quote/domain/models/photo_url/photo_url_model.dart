import 'package:calculator_flutter_app/features/quote/domain/models/photo_url/photo_url_entity.dart';

class PhotoUrlModel {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  PhotoUrlModel({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  factory PhotoUrlModel.fromEntity(PhotoUrlEntity entity) {
    return PhotoUrlModel(
      raw: entity.raw,
      full: entity.full,
      regular: entity.regular,
      small: entity.small,
      thumb: entity.thumb,
    );
  }
}
