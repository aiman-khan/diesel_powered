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
import 'package:diesel_powered/util/consts/api.dart';
import 'package:diesel_powered/util/exceptions/message_exception.dart';
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
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.post(
        Apis.verifyOtp,
        {
          "phone": input.phone,
          "otp": input.otp,
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      final token = response["verificationToken"] as String;

      return VerifyOtpUsecaseOutput(verificationToken: token);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT verifyOtp: $e");
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<ResetPasswordUsecaseOutput> resetPassword(
      ResetPasswordUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.post(
        Apis.resetPassword,
        {
          "verificationToken": input.verificationToken,
          "phone": input.phone,
          "password": input.password,
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      return ResetPasswordUsecaseOutput();
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT resetPassword: $e");
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<DeleteUserUsecaseOutput> deleteUser(
      DeleteUserUsecaseInput input) async {
    try {
      _logger.i(input.toString());

      final response = await _networkCallHelper.post(
        Apis.deleteUser,
        headers: {
          'Authorization': 'Bearer ${input.bearer}',
        },
        {},
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      return DeleteUserUsecaseOutput();
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT deleteUser: $e");
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<InitiateResetPasswordVerificationUsecaseOutput>
      resetPasswordInitiateVerification(
          InitiateResetPasswordVerificationUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.post(
        Apis.resetPasswordInitiateVerification,
        {
          "phone": input.phone,
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      return InitiateResetPasswordVerificationUsecaseOutput();
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger
          .e("SOMETHING WENT WRONG AT resetPasswordInitiateVerification: $e");
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<UpdateProfileUsecaseOutput> updateProfile(
      UpdateProfileUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final filePaths = input.img != null ? [input.img!] : null;

      final response = await _networkCallHelper.multipart(
        Apis.updateProfile,
        filePaths: filePaths,
        filesParam: 'img',
        headers: {
          'Authorization': 'Bearer ${input.bearer}',
        },
        body: {
          "phone": input.phone,
          "email": input.email,
          "password": input.password,
          "fullName": input.fullName,
          "verificationToken": input.verificationToken,
          "countryCode": input.countryCode,
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      return UpdateProfileUsecaseOutput();
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT updateProfile: $e");
      throw SomethingWentWrongException();
    }
  }
}
