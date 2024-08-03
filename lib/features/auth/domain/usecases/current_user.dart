import 'package:diesel_powered/features/auth/domain/models/user/user_entity.dart';
import 'package:diesel_powered/features/auth/domain/models/user/user_model.dart';
import 'package:diesel_powered/features/auth/domain/repository/auth_repository.dart';
import 'package:diesel_powered/infrastructure/usecase.dart';
import 'package:diesel_powered/infrastructure/usecase_input.dart';
import 'package:diesel_powered/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class CurrentUserUsecaseInput extends Input {
  CurrentUserUsecaseInput({required this.bearer});

  final String bearer;
}

class CurrentUserUsecaseOutput extends Output {
  CurrentUserUsecaseOutput({required UserEntity driver}) : _driver = driver;

  final UserEntity _driver;

  UserModel get driver => UserModel.fromEntity(_driver);
}

@lazySingleton
class CurrentUserUsecase
    extends Usecase<CurrentUserUsecaseInput, CurrentUserUsecaseOutput> {
  final AuthRepository _authRepository;

  CurrentUserUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<CurrentUserUsecaseOutput> call(CurrentUserUsecaseInput input) async {
    return await _authRepository.currentUser(input);
  }
}
