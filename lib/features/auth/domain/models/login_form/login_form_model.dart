class LoginFormModel {
  final String? email;
  final String? password;
  final String? phone;

  LoginFormModel({
    this.email,
    this.password,
    this.phone,
  });

  factory LoginFormModel.initial() {
    return LoginFormModel();
  }

  LoginFormModel copyWith({
    String? email,
    String? password,
    String? phone,
    String? countryCode,
  }) {
    return LoginFormModel(
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }
}
