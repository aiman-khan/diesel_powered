import 'package:diesel_powered/features/image_picker/domain/usecases/pick_gallery_image_usecase.dart';
import 'package:diesel_powered/infrastructure/usecase_input.dart';
import 'package:diesel_powered/util/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_gallery_image_provider.g.dart';

@riverpod
Future<String> getGalleryImage(Ref ref) async {
  final pickGalleryImageUsecase = sl<PickGalleryImageUsecase>();
  final output = await pickGalleryImageUsecase(NoInput());
  return output;
}
