import 'package:diesel_powered/features/auth/data/entities/user/rest_user.dart';
import 'package:diesel_powered/features/auth/domain/data/auth_remote_datasource.dart';
import 'package:diesel_powered/features/auth/domain/usecases/current_user.dart';
import 'package:diesel_powered/features/auth/domain/usecases/delete_user.dart';
import 'package:diesel_powered/features/auth/domain/usecases/initiate_reset_password_verification.dart';
import 'package:diesel_powered/features/auth/domain/usecases/login_driver.dart';
import 'package:diesel_powered/features/auth/domain/usecases/register_driver.dart';
import 'package:diesel_powered/features/auth/domain/usecases/reset_password.dart';
import 'package:diesel_powered/features/auth/domain/usecases/update_profile.dart';
import 'package:diesel_powered/features/auth/domain/usecases/verify_otp.dart';
import 'package:diesel_powered/helpers/network_call_helper/network_call_helper.dart';
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
  Future<CurrentUserUsecaseOutput> currentUser(
      CurrentUserUsecaseInput input) async {
    await Future.delayed(const Duration(seconds: 2));

    const user = RestUserEntity(
      id: 1,
      email: 'john@gmail.com',
      name: 'John Doe',
      phone: '+123823878832',
      img: 'https://randomuser.me/api/portraits/men/1.jpg',
    );

    return CurrentUserUsecaseOutput(user: user);
  }

  @override
  Future<LoginDriverUsecaseOutput> login(LoginDriverUsecaseInput input) async {
    await Future.delayed(const Duration(seconds: 2));

    return LoginDriverUsecaseOutput(token: '1234');
  }

  @override
  Future<RegisterUsecaseOutput> register(RegisterUsecaseInput input) async {
    await Future.delayed(const Duration(seconds: 2));

    return RegisterUsecaseOutput(token: '1234');
  }

  @override
  Future<VerifyOtpUsecaseOutput> verifyOtp(VerifyOtpUsecaseInput input) async {
    await Future.delayed(const Duration(seconds: 2));

    return VerifyOtpUsecaseOutput(verificationToken: '1234');
  }

  @override
  Future<ResetPasswordUsecaseOutput> resetPassword(
      ResetPasswordUsecaseInput input) async {
    await Future.delayed(const Duration(seconds: 2));

    return ResetPasswordUsecaseOutput();
  }

  @override
  Future<DeleteUserUsecaseOutput> deleteUser(
      DeleteUserUsecaseInput input) async {
    return DeleteUserUsecaseOutput();
  }

  @override
  Future<InitiateResetPasswordVerificationUsecaseOutput>
      resetPasswordInitiateVerification(
          InitiateResetPasswordVerificationUsecaseInput input) async {
    return InitiateResetPasswordVerificationUsecaseOutput();
  }

  @override
  Future<UpdateProfileUsecaseOutput> updateProfile(
      UpdateProfileUsecaseInput input) async {
    await Future.delayed(const Duration(seconds: 2));
    return UpdateProfileUsecaseOutput();
  }
}
