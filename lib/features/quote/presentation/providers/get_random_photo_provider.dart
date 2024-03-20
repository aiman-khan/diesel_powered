import 'package:calculator_flutter_app/features/quote/domain/models/photo/photo_model.dart';
import 'package:calculator_flutter_app/features/quote/domain/usecases/get_random_quote_usecase.dart';
import 'package:calculator_flutter_app/util/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getRandomPhotoProvider =
    FutureProvider.autoDispose<PhotoModel>((ref) async {
  final getRandomPhotoUsecase = sl<GetRandomPhotoUsecase>();
  final input = GetRandomPhotoUsecaseInput();
  final output = await getRandomPhotoUsecase(input);
  return output.photo;
});
