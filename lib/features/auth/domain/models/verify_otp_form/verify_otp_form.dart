class VerifyOtpFormModel {
  final String? email;
  final String? otp;

  VerifyOtpFormModel({
    this.email,
    this.otp,
  });

  VerifyOtpFormModel copyWith({String? email, String? otp}) {
    return VerifyOtpFormModel(
      email: email ?? this.email,
      otp: otp,
    );
  }
}
