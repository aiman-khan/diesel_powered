import 'package:diesel_powered/features/auth/domain/models/register_form/register_form_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_form_provider.g.dart';

@riverpod
class RegisterForm extends _$RegisterForm {
  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setImage(String image) {
    state = state.copyWith(image: image);
  }

  void setPhoneNumber(String phone) {
    state = state.copyWith(phone: phone);
  }

  @override
  RegisterFormModel build() {
    return RegisterFormModel.initial();
  }
}
