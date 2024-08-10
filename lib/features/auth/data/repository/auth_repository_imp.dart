import 'package:calculator_flutter_app/features/auth/domain/data/auth_local_datasource.dart';
import 'package:calculator_flutter_app/features/auth/domain/data/auth_remote_datasource.dart';
import 'package:calculator_flutter_app/features/auth/domain/repository/auth_repository.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/current_user.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/delete_auth.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/delete_user.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/get_auth.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/initiate_reset_password_verification.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/login_driver.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/register_driver.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/reset_password.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/save_auth.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/update_profile.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/verify_otp.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImp({
    required AuthRemoteDataSource authRemoteDataSource,
    required AuthLocalDataSource authLocalDataSource,
  })  : _authRemoteDataSource = authRemoteDataSource,
        _authLocalDataSource = authLocalDataSource;

  @override
  Future<LoginDriverUsecaseOutput> login(LoginDriverUsecaseInput input) async {
    return _authRemoteDataSource.login(input);
  }

  @override
  Future<RegisterUsecaseOutput> register(RegisterUsecaseInput input) async {
    return _authRemoteDataSource.register(input);
  }

  @override
  Future<SaveAuthUsecaseOutput> saveAuth(SaveAuthUsecaseInput input) async {
    return _authLocalDataSource.saveAuth(input);
  }

  @override
  Future<GetAuthUsecaseOutput> getAuth(GetAuthUsecaseInput input) async {
    return _authLocalDataSource.getAuth(input);
  }

  @override
  Future<DeleteAuthUsecaseOutput> deleteAuth(
      DeleteAuthUsecaseInput input) async {
    return _authLocalDataSource.deleteAuth(input);
  }

  @override
  Future<CurrentUserUsecaseOutput> currentUser(
      CurrentUserUsecaseInput input) async {
    return _authRemoteDataSource.currentUser(input);
  }

  @override
  Future<DeleteUserUsecaseOutput> deleteUser(
      DeleteUserUsecaseInput input) async {
    return _authRemoteDataSource.deleteUser(input);
  }

  @override
  Future<ResetPasswordUsecaseOutput> resetPassword(
      ResetPasswordUsecaseInput input) async {
    return _authRemoteDataSource.resetPassword(input);
  }

  @override
  Future<UpdateProfileUsecaseOutput> updateProfile(
      UpdateProfileUsecaseInput input) async {
    return _authRemoteDataSource.updateProfile(input);
  }

  @override
  Future<VerifyOtpUsecaseOutput> verifyOtp(VerifyOtpUsecaseInput input) {
    return _authRemoteDataSource.verifyOtp(input);
  }

  @override
  Future<InitiateResetPasswordVerificationUsecaseOutput>
      resetPasswordInitiateVerification(
          InitiateResetPasswordVerificationUsecaseInput input) {
    return _authRemoteDataSource.resetPasswordInitiateVerification(input);
  }
}
