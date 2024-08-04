import 'package:diesel_powered/features/quote/domain/usecases/get_random_photo_usecase.dart';
import 'package:diesel_powered/features/quote/domain/usecases/get_random_quote_usecase.dart';
import 'package:diesel_powered/infrastructure/repository.dart';

abstract class AuthRepository extends Repository {
  Future<GetRandomPhotoUsecaseOutput> getRandomPhoto(
      GetRandomPhotoUsecaseInput input);

  Future<GetRandomQuoteUsecaseOutput> getRandomQuote(
      GetRandomQuoteUsecaseInput input);
}
