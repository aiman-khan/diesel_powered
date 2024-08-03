import 'package:diesel_powered/features/auth/domain/repository/auth_repository.dart';
import 'package:diesel_powered/infrastructure/usecase.dart';
import 'package:diesel_powered/infrastructure/usecase_input.dart';
import 'package:diesel_powered/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class RegisterDriverUsecaseInput extends Input {
  RegisterDriverUsecaseInput({
    required this.verificationToken,
    required this.fullName,
    required this.email,
    required this.password,
    required this.phone,
    required this.typeId,
    required this.countryCode,
    this.vehicleId,
    this.vehicleLicenseNo,
    this.drivingLicenseNo,
    this.fleetId,
  });

  final String fullName;
  final String email;
  final String password;
  final int? vehicleId;
  final int typeId;
  final String? vehicleLicenseNo;
  final String? drivingLicenseNo;
  final String phone;
  final int? fleetId;
  final String verificationToken;
  final String countryCode;
}

class RegisterDriverUsecaseOutput extends Output {
  final String token;

  RegisterDriverUsecaseOutput({required this.token});
}

@lazySingleton
class RegisterDriverUsecase
    extends Usecase<RegisterDriverUsecaseInput, RegisterDriverUsecaseOutput> {
  final AuthRepository _authRepository;

  RegisterDriverUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<RegisterDriverUsecaseOutput> call(
      RegisterDriverUsecaseInput input) async {
    return await _authRepository.register(input);
  }
}
