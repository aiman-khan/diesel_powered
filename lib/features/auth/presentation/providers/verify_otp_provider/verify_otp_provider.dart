import 'package:diesel_powered/features/auth/domain/usecases/verify_otp.dart';
import 'package:diesel_powered/features/auth/presentation/providers/otp_form_provider/otp_form_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/register/register_form_provider.dart';
import 'package:diesel_powered/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verify_otp_provider.g.dart';

@riverpod
Future<void> verifyOtp(VerifyOtpRef ref) async {
  final verifyOtp = sl<VerifyOtpUsecase>();

  final registerForm = ref.read(registerFormProvider);
  final otp = ref.read(otpFormNotifierProvider);

  final input = VerifyOtpUsecaseInput(
    otp: otp!,
    phone: registerForm.phone!,
  );

  final output = await verifyOtp(input);
}
