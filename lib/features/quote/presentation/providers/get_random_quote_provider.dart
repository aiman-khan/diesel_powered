import 'package:diesel_powered/features/quote/domain/models/quote/quote_model.dart';
import 'package:diesel_powered/features/quote/domain/usecases/get_random_photo_usecase.dart';
import 'package:diesel_powered/util/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getRandomQuoteProvider =
    FutureProvider.autoDispose<QuoteModel>((ref) async {
  final getRandomQuoteUsecase = sl<GetRandomQuoteUsecase>();
  final input = GetRandomQuoteUsecaseInput();
  final output = await getRandomQuoteUsecase(input);
  return output.quote;
});
