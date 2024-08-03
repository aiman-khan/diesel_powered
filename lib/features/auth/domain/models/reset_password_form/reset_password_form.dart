class ResetPasswordFormModel {
  final String? verificationToken;
  final String? password;
  final String? phone;

  ResetPasswordFormModel({
    this.verificationToken,
    this.password,
    this.phone,
  });

  factory ResetPasswordFormModel.initial() {
    return ResetPasswordFormModel();
  }

  ResetPasswordFormModel copyWith({
    String? verificationToken,
    String? password,
    String? phone,
  }) {
    return ResetPasswordFormModel(
      verificationToken: verificationToken ?? this.verificationToken,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }
}
