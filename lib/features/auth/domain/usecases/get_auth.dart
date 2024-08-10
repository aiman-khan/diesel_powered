import 'package:calculator_flutter_app/features/auth/domain/repository/auth_repository.dart';
import 'package:calculator_flutter_app/infrastructure/usecase.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_input.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class GetAuthUsecaseInput extends Input {
  GetAuthUsecaseInput();
}

class GetAuthUsecaseOutput extends Output {
  GetAuthUsecaseOutput({this.bearerToken});

  final String? bearerToken;
}

@lazySingleton
class GetAuthUsecase
    extends Usecase<GetAuthUsecaseInput, GetAuthUsecaseOutput> {
  final AuthRepository _authRepository;

  GetAuthUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<GetAuthUsecaseOutput> call(GetAuthUsecaseInput input) async {
    return await _authRepository.getAuth(input);
  }
}
