import 'package:diesel_powered/features/auth/domain/models/user/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_user.freezed.dart';
part 'rest_user.g.dart';

@freezed
class RestUserEntity extends UserEntity with _$RestUserEntity {
  const factory RestUserEntity({
    required int id,
    required String email,
    required String name,
    required String phone,
    required String? img,
  }) = _RestUserEntity;

  factory RestUserEntity.fromJson(Map<String, Object?> json) =>
      _$RestUserEntityFromJson(json);
}
