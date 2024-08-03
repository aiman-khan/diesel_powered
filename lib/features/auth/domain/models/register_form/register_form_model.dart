class RegisterFormModel {
  final String? email;
  final String? password;
  final String? name;
  final String? image;
  final String? phone;
  final int? vehicleId;
  final String? vehicleLicenseNumber;
  final String? drivingLicenseNumber;
  final int? fleetId;
  final int? typeId;
  final String? verificationToken;
  final String? countryCode;

  RegisterFormModel({
    this.email,
    this.password,
    this.name,
    this.image,
    this.phone,
    this.vehicleId,
    this.vehicleLicenseNumber,
    this.drivingLicenseNumber,
    this.fleetId,
    this.verificationToken,
    this.typeId,
    this.countryCode,
  });

  factory RegisterFormModel.initial() {
    return RegisterFormModel(typeId: 1);
  }

  RegisterFormModel copyWith({
    String? email,
    String? password,
    String? name,
    String? profileType,
    String? image,
    String? phone,
    int? vehicleId,
    String? vehicleLicenseNumber,
    String? drivingLicenseNumber,
    int? fleetId,
    int? typeId,
    String? verificationToken,
    String? countryCode,
  }) {
    return RegisterFormModel(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      image: image ?? this.image,
      phone: phone ?? this.phone,
      vehicleId: vehicleId ?? this.vehicleId,
      vehicleLicenseNumber: vehicleLicenseNumber ?? this.vehicleLicenseNumber,
      drivingLicenseNumber: drivingLicenseNumber ?? this.drivingLicenseNumber,
      verificationToken: verificationToken ?? this.verificationToken,
      fleetId: fleetId ?? this.fleetId,
      typeId: typeId ?? this.typeId,
      countryCode: countryCode ?? this.countryCode,
    );
  }
}
