import 'package:diesel_powered/features/auth/domain/repository/auth_repository.dart';
import 'package:diesel_powered/infrastructure/usecase.dart';
import 'package:diesel_powered/infrastructure/usecase_input.dart';
import 'package:diesel_powered/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class DeleteUserUsecaseInput extends Input {
  DeleteUserUsecaseInput({
    required this.bearer,
  });

  final String bearer;
}

class DeleteUserUsecaseOutput extends Output {
  DeleteUserUsecaseOutput();
}

@lazySingleton
class DeleteUserUsecase
    extends Usecase<DeleteUserUsecaseInput, DeleteUserUsecaseOutput> {
  final AuthRepository _authRepository;

  DeleteUserUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<DeleteUserUsecaseOutput> call(DeleteUserUsecaseInput input) async {
    return await _authRepository.deleteUser(input);
  }
}
