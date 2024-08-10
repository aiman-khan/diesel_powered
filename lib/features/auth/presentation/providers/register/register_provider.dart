import 'package:calculator_flutter_app/features/auth/domain/usecases/register_driver.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/save_auth.dart';
import 'package:calculator_flutter_app/features/auth/presentation/providers/register/register_form_provider.dart';
import 'package:calculator_flutter_app/util/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_provider.g.dart';

@riverpod
Future<void> register(Ref ref) async {
  final register = sl<RegisterUsecase>();
  final saveAuth = sl<SaveAuthUsecase>();

  final registerForm = ref.read(registerFormProvider);
  final input = RegisterUsecaseInput(
      password: registerForm.password!,
      email: registerForm.email!,
      fullName: registerForm.name!,
      phone: '8781979878');

  final output = await register(input);

  final saveAuthInput = SaveAuthUsecaseInput(bearerToken: output.token);

  await saveAuth(saveAuthInput);
}
