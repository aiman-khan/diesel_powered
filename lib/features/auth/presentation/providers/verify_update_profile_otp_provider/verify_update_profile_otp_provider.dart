import 'package:diesel_powered/features/auth/domain/usecases/verify_otp.dart';
import 'package:diesel_powered/features/auth/presentation/providers/otp_form_provider/otp_form_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/update_profile_provider/update_profile_form_provider.dart';
import 'package:diesel_powered/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verify_update_profile_otp_provider.g.dart';

@riverpod
Future<void> verifyUpdateProfileOtp(VerifyUpdateProfileOtpRef ref) async {
  final verifyOtp = sl<VerifyOtpUsecase>();

  final profileForm = ref.read(updateProfileFormProvider);
  final otp = ref.read(otpFormNotifierProvider);

  final input = VerifyOtpUsecaseInput(
    otp: otp!,
    phone: profileForm.phone!,
  );

  final output = await verifyOtp(input);
  ref
      .read(updateProfileFormProvider.notifier)
      .setVerificationToken(output.verificationToken);
}
