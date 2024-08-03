abstract class UserEntity {
  final int id;
  final String email;
  final String name;
  final String phone;
  final String? img;

  UserEntity({
    required this.email,
    required this.name,
    required this.phone,
    required this.id,
    this.img,
  });
}
