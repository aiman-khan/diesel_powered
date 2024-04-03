import 'package:calculator_flutter_app/features/auth/domain/models/update_profile_form/update_profile_form_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_profile_form_provider.g.dart';

@riverpod
class UpdateProfileForm extends _$UpdateProfileForm {
  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setImage(String image) {
    state = state.copyWith(image: image);
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPhone(String phone) {
    state = state.copyWith(phone: phone);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setVerificationToken(String verificationToken) {
    state = state.copyWith(verificationToken: verificationToken);
  }

  void setCountryCode(String countryCode) {
    state = state.copyWith(countryCode: countryCode);
  }

  @override
  UpdateProfileFormModel build() {
    return UpdateProfileFormModel();
  }
}
