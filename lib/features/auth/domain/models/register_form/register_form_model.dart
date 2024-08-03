class RegisterFormModel {
  final String? email;
  final String? password;
  final String? name;
  final String? image;
  final String? phone;

  RegisterFormModel({
    this.email,
    this.password,
    this.name,
    this.image,
    this.phone,
  });

  factory RegisterFormModel.initial() {
    return RegisterFormModel();
  }

  RegisterFormModel copyWith({
    String? email,
    String? password,
    String? name,
    String? image,
    String? phone,
  }) {
    return RegisterFormModel(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      image: image ?? this.image,
      phone: phone ?? this.phone,
    );
  }
}
