import 'package:diesel_powered/features/quote/domain/models/photo/photo_model.dart';
import 'package:diesel_powered/features/quote/domain/usecases/get_random_quote_usecase.dart';
import 'package:diesel_powered/util/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getRandomPhotoProvider =
    FutureProvider.autoDispose<PhotoModel>((ref) async {
  final getRandomPhotoUsecase = sl<GetRandomPhotoUsecase>();
  final input = GetRandomPhotoUsecaseInput();
  final output = await getRandomPhotoUsecase(input);
  return output.photo;
});
