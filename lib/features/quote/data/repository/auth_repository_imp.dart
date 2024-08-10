import 'package:calculator_flutter_app/features/quote/domain/data/auth_remote_datasource.dart';
import 'package:calculator_flutter_app/features/quote/domain/repository/auth_repository.dart';
import 'package:calculator_flutter_app/features/quote/domain/usecases/get_random_photo_usecase.dart';
import 'package:calculator_flutter_app/features/quote/domain/usecases/get_random_quote_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImp({
    required AuthRemoteDataSource authRemoteDataSource,
  }) : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<GetRandomPhotoUsecaseOutput> getRandomPhoto(
      GetRandomPhotoUsecaseInput input) async {
    return _authRemoteDataSource.getRandomPhoto(input);
  }

  @override
  Future<GetRandomQuoteUsecaseOutput> getRandomQuote(
      GetRandomQuoteUsecaseInput input) {
    return _authRemoteDataSource.getRandomQuote(input);
  }
}
