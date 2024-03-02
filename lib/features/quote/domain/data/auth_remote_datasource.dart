import 'package:diesel_powered/features/quote/domain/usecases/get_random_photo_usecase.dart';
import 'package:diesel_powered/features/quote/domain/usecases/get_random_quote_usecase.dart';
import 'package:diesel_powered/infrastructure/datasource.dart';

abstract class AuthRemoteDataSource extends DataSource {
  Future<GetRandomPhotoUsecaseOutput> getRandomPhoto(
      GetRandomPhotoUsecaseInput input);

  Future<GetRandomQuoteUsecaseOutput> getRandomQuote(
      GetRandomQuoteUsecaseInput input);
}
