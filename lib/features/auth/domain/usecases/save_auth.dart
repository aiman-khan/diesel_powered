import 'package:calculator_flutter_app/features/auth/domain/repository/auth_repository.dart';
import 'package:calculator_flutter_app/infrastructure/usecase.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_input.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class SaveAuthUsecaseInput extends Input {
  SaveAuthUsecaseInput({this.bearerToken});

  final String? bearerToken;
}

class SaveAuthUsecaseOutput extends Output {
  SaveAuthUsecaseOutput();
}

@lazySingleton
class SaveAuthUsecase
    extends Usecase<SaveAuthUsecaseInput, SaveAuthUsecaseOutput> {
  final AuthRepository _authRepository;

  SaveAuthUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<SaveAuthUsecaseOutput> call(SaveAuthUsecaseInput input) async {
    return await _authRepository.saveAuth(input);
  }
}
