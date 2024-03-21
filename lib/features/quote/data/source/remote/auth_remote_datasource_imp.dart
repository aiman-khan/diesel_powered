import 'package:calculator_flutter_app/features/quote/data/entities/photo/rest_photo.dart';
import 'package:calculator_flutter_app/features/quote/data/entities/photo_url/rest_photo_url.dart';
import 'package:calculator_flutter_app/features/quote/data/entities/quote/rest_quote.dart';
import 'package:calculator_flutter_app/features/quote/domain/data/auth_remote_datasource.dart';
import 'package:calculator_flutter_app/features/quote/domain/usecases/get_random_photo_usecase.dart';
import 'package:calculator_flutter_app/features/quote/domain/usecases/get_random_quote_usecase.dart';
import 'package:calculator_flutter_app/helpers/network_call_helper/network_call_helper.dart';
import 'package:calculator_flutter_app/util/consts/api.dart';
import 'package:calculator_flutter_app/util/exceptions/message_exception.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final Logger _logger;
  final NetworkCallHelper _networkCallHelper;

  AuthRemoteDataSourceImp({
    required Logger logger,
    required NetworkCallHelper networkCallHelper,
  })  : _logger = logger,
        _networkCallHelper = networkCallHelper;

  @override
  Future<GetRandomPhotoUsecaseOutput> getRandomPhoto(
      GetRandomPhotoUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.get(Apis.photosApi);

      if (response["errors"] != null) {
        throw MessageException(message: response['errors']);
      }

      final urls = response['urls'] != null
          ? RestPhotoUrlEntity.fromJson(
              response['urls'] as Map<String, dynamic>)
          : null;

      return GetRandomPhotoUsecaseOutput(photo: RestPhotoEntity(urls: urls));
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT getRandomPhoto: $e");
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<GetRandomQuoteUsecaseOutput> getRandomQuote(
      GetRandomQuoteUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.get(Apis.quotesApi, params: {
        "maxLength": 80,
      });

      _logger.i("Quote Response: $response");

      final data = List<Map<String, dynamic>>.from(response as List<dynamic>);

      final quotes = data.map(RestQuoteEntity.fromJson).toList();

      return GetRandomQuoteUsecaseOutput(quote: quotes.first);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT getRandomQuotes: $e");
      throw SomethingWentWrongException();
    }
  }
}
