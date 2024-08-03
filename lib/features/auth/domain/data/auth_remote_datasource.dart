import 'package:diesel_powered/features/auth/domain/usecases/current_user.dart';
import 'package:diesel_powered/features/auth/domain/usecases/delete_user.dart';
import 'package:diesel_powered/features/auth/domain/usecases/initiate_reset_password_verification.dart';
import 'package:diesel_powered/features/auth/domain/usecases/login_driver.dart';
import 'package:diesel_powered/features/auth/domain/usecases/register_driver.dart';
import 'package:diesel_powered/features/auth/domain/usecases/reset_password.dart';
import 'package:diesel_powered/features/auth/domain/usecases/update_profile.dart';
import 'package:diesel_powered/features/auth/domain/usecases/verify_otp.dart';
import 'package:diesel_powered/infrastructure/datasource.dart';

abstract class AuthRemoteDataSource extends DataSource {
  Future<LoginDriverUsecaseOutput> login(LoginDriverUsecaseInput input);

  Future<RegisterDriverUsecaseOutput> register(
      RegisterDriverUsecaseInput input);

  Future<CurrentUserUsecaseOutput> currentUser(CurrentUserUsecaseInput input);

  Future<DeleteUserUsecaseOutput> deleteUser(DeleteUserUsecaseInput input);

  Future<ResetPasswordUsecaseOutput> resetPassword(
      ResetPasswordUsecaseInput input);

  Future<VerifyOtpUsecaseOutput> verifyOtp(VerifyOtpUsecaseInput input);

  Future<InitiateResetPasswordVerificationUsecaseOutput>
      resetPasswordInitiateVerification(
          InitiateResetPasswordVerificationUsecaseInput input);

  Future<UpdateProfileUsecaseOutput> updateProfile(
      UpdateProfileUsecaseInput input);
}
