import 'package:diesel_powered/features/auth/domain/repository/auth_repository.dart';
import 'package:diesel_powered/infrastructure/usecase.dart';
import 'package:diesel_powered/infrastructure/usecase_input.dart';
import 'package:diesel_powered/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class RegisterUsecaseInput extends Input {
  RegisterUsecaseInput({
    required this.fullName,
    required this.email,
    required this.password,
    required this.phone,
  });

  final String fullName;
  final String email;
  final String password;

  final String phone;
}

class RegisterUsecaseOutput extends Output {
  final String token;

  RegisterUsecaseOutput({required this.token});
}

@lazySingleton
class RegisterUsecase
    extends Usecase<RegisterUsecaseInput, RegisterUsecaseOutput> {
  final AuthRepository _authRepository;

  RegisterUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<RegisterUsecaseOutput> call(RegisterUsecaseInput input) async {
    return await _authRepository.register(input);
  }
}
