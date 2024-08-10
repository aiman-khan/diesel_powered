import 'package:calculator_flutter_app/features/auth/domain/models/reset_password_form/reset_password_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reset_password_form_provider.g.dart';

@riverpod
class ResetPasswordForm extends _$ResetPasswordForm {
  void setVerificationToken(String value) {
    state = state.copyWith(verificationToken: value);
  }

  void setPassword(String value) {
    state = state.copyWith(password: value);
  }

  void setPhone(String value) {
    state = state.copyWith(phone: value);
  }

  @override
  ResetPasswordFormModel build() {
    return ResetPasswordFormModel();
  }
}
