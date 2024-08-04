import 'package:diesel_powered/features/quote/domain/models/quote/quote_entity.dart';
import 'package:diesel_powered/features/quote/domain/models/quote/quote_model.dart';
import 'package:diesel_powered/features/quote/domain/repository/auth_repository.dart';
import 'package:diesel_powered/infrastructure/usecase.dart';
import 'package:diesel_powered/infrastructure/usecase_input.dart';
import 'package:diesel_powered/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class GetRandomQuoteUsecaseInput extends Input {
  GetRandomQuoteUsecaseInput();
}

class GetRandomQuoteUsecaseOutput extends Output {
  GetRandomQuoteUsecaseOutput({required QuoteEntity quote}) : _quote = quote;

  final QuoteEntity _quote;

  QuoteModel get quote => QuoteModel.fromEntity(_quote);
}

@lazySingleton
class GetRandomQuoteUsecase
    extends Usecase<GetRandomQuoteUsecaseInput, GetRandomQuoteUsecaseOutput> {
  final AuthRepository _authRepository;

  GetRandomQuoteUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<GetRandomQuoteUsecaseOutput> call(
      GetRandomQuoteUsecaseInput input) async {
    return await _authRepository.getRandomQuote(input);
  }
}
