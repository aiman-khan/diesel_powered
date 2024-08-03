import 'package:diesel_powered/features/auth/domain/models/user/user_entity.dart';

class UserModel {
  final int id;
  final String email;
  final String name;
  final String phone;
  final String? img;

  UserModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.id,
    this.img,
  });

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      email: entity.email,
      phone: entity.phone,
      name: entity.name,
      id: entity.id,
      img: entity.img,
    );
  }
}
