import 'package:calculator_flutter_app/features/auth/domain/usecases/reset_password.dart';
import 'package:calculator_flutter_app/features/auth/presentation/providers/reset_password/reset_password_form_provider.dart';
import 'package:calculator_flutter_app/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reset_password_provider.g.dart';

@riverpod
Future<void> resetPassword(ResetPasswordRef ref) async {
  final resetPassword = sl<ResetPasswordUsecase>();

  final resetPasswordForm = ref.read(resetPasswordFormProvider);
  final input = ResetPasswordUsecaseInput(
    password: resetPasswordForm.password!,
    verificationToken: resetPasswordForm.verificationToken!,
    phone: resetPasswordForm.phone!,
  );

  await resetPassword(input);
}
