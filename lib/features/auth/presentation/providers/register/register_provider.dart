import 'package:diesel_powered/features/auth/domain/usecases/register_driver.dart';
import 'package:diesel_powered/features/auth/domain/usecases/save_auth.dart';
import 'package:diesel_powered/features/auth/presentation/providers/register/register_form_provider.dart';
import 'package:diesel_powered/util/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_provider.g.dart';

@riverpod
Future<void> register(Ref ref) async {
  final register = sl<RegisterDriverUsecase>();
  final saveAuth = sl<SaveAuthUsecase>();

  final registerForm = ref.read(registerFormProvider);
  final input = RegisterDriverUsecaseInput(
    password: registerForm.password!,
    email: registerForm.email!,
    fullName: registerForm.name!,
    phone: registerForm.phone!,
    vehicleLicenseNo: registerForm.vehicleLicenseNumber,
    vehicleId: registerForm.vehicleId,
    drivingLicenseNo: registerForm.drivingLicenseNumber,
    verificationToken: registerForm.verificationToken!,
    typeId: registerForm.typeId!,
    fleetId: registerForm.fleetId,
    countryCode: registerForm.countryCode!,
  );

  final output = await register(input);

  final saveAuthInput = SaveAuthUsecaseInput(bearerToken: output.token);

  await saveAuth(saveAuthInput);
}
