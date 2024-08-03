import 'package:diesel_powered/features/auth/domain/models/vehicle/vehicle_entity.dart';
import 'package:diesel_powered/features/auth/domain/models/vehicle_model/vehicle_model_model.dart';

class VehicleModel {
  final int id;
  final VehicleModelModel model;
  final String vehicleLicenseNo;

  VehicleModel({
    required this.id,
    required this.model,
    required this.vehicleLicenseNo,
  });

  factory VehicleModel.fromEntity(VehicleEntity entity) {
    return VehicleModel(
      id: entity.id,
      model: VehicleModelModel.fromEntity(entity.model),
      vehicleLicenseNo: entity.vehicleLicenseNo,
    );
  }
}
