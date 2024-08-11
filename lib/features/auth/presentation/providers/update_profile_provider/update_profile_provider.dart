import 'package:diesel_powered/features/auth/domain/usecases/update_profile.dart';
import 'package:diesel_powered/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/update_profile_provider/update_profile_form_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/user_provider/user_provider.dart';
import 'package:diesel_powered/util/di/di.dart';
import 'package:diesel_powered/util/exceptions/message_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_profile_provider.g.dart';

@riverpod
Future<void> updateProfile(UpdateProfileRef ref) async {
  final updateProfile = sl<UpdateProfileUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final form = ref.read(updateProfileFormProvider);

  if (form.password != null &&
      form.password!.isNotEmpty &&
      form.password!.length < 6) {
    throw MessageException(message: "Password length should be at least 6");
  }

  final input = UpdateProfileUsecaseInput(
    bearer: bearer!,
    fullName: form.name,
    password: form.password,
    verificationToken: form.verificationToken,
    email: form.email,
    phone: form.phone,
    img: form.image,
    countryCode: form.countryCode,
  );

  await updateProfile(input);

  ref.invalidate(userProvider);
}
