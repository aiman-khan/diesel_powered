import 'package:calculator_flutter_app/features/quote/domain/models/photo_url/photo_url_entity.dart';

abstract class PhotoEntity {
  final PhotoUrlEntity? urls;

  PhotoEntity({required this.urls});
}
