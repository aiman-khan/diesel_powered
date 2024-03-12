import 'package:calculator_flutter_app/features/quote/domain/usecases/get_random_photo_usecase.dart';
import 'package:calculator_flutter_app/features/quote/domain/usecases/get_random_quote_usecase.dart';
import 'package:calculator_flutter_app/infrastructure/repository.dart';

abstract class AuthRepository extends Repository {
  Future<GetRandomPhotoUsecaseOutput> getRandomPhoto(
      GetRandomPhotoUsecaseInput input);

  Future<GetRandomQuoteUsecaseOutput> getRandomQuote(
      GetRandomQuoteUsecaseInput input);
}
