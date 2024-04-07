import 'package:calculator_flutter_app/features/auth/domain/models/login_form/login_form_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_form_provider.g.dart';

@riverpod
class LoginForm extends _$LoginForm {
  void setEmail(String value) {
    state = state.copyWith(email: value);
  }

  void setPassword(String value) {
    state = state.copyWith(password: value);
  }

  void setPhone(String value) {
    state = state.copyWith(phone: value);
  }

  void setCountryCode(String value) {
    state = state.copyWith(countryCode: value);
  }

  @override
  LoginFormModel build() {
    return LoginFormModel.initial();
  }
}
