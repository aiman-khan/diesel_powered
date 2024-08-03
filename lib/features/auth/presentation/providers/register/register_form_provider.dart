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

  void setVehicleId(int vehicleId) {
    state = state.copyWith(vehicleId: vehicleId);
  }

  void setVehicleLicenseNumber(String vehicleLicenseNumber) {
    state = state.copyWith(vehicleLicenseNumber: vehicleLicenseNumber);
  }

  void setDrivingLicenseNumber(String drivingLicenseNumber) {
    state = state.copyWith(drivingLicenseNumber: drivingLicenseNumber);
  }

  void setVerificationToken(String verificationToken) {
    state = state.copyWith(verificationToken: verificationToken);
  }

  void setFleetId(int fleetId) {
    state = state.copyWith(fleetId: fleetId);
  }

  void setTypeId(int typeId) {
    state = state.copyWith(typeId: typeId);
  }

  void setCountryCode(String countryCode) {
    state = state.copyWith(countryCode: countryCode);
  }

  @override
  RegisterFormModel build() {
    return RegisterFormModel.initial();
  }
}
