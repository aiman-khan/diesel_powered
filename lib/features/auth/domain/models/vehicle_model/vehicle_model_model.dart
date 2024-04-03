import 'package:calculator_flutter_app/features/auth/domain/models/vehicle_model/vehicle_model_entity.dart';

class VehicleModelModel {
  final int id;
  final String img;
  final String name;

  VehicleModelModel({
    required this.id,
    required this.name,
    required this.img,
  });

  factory VehicleModelModel.fromEntity(VehicleModelEntity entity) {
    return VehicleModelModel(
      id: entity.id,
      name: entity.name,
      img: entity.img,
    );
  }
}
