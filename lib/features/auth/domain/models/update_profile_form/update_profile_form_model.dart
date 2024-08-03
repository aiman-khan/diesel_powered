class UpdateProfileFormModel {
  final String? name;
  final String? email;
  final String? password;
  final String? verificationToken;
  final String? phone;
  final String? image;
  final String? countryCode;

  UpdateProfileFormModel({
    this.password,
    this.email,
    this.name,
    this.phone,
    this.verificationToken,
    this.image,
    this.countryCode,
  });

  UpdateProfileFormModel copyWith({
    String? name,
    String? password,
    String? email,
    String? verificationToken,
    String? phone,
    String? image,
    String? countryCode,
  }) {
    return UpdateProfileFormModel(
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      verificationToken: verificationToken ?? this.verificationToken,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      countryCode: countryCode ?? this.countryCode,
    );
  }
}
