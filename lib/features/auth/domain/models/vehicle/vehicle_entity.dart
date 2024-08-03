import 'package:diesel_powered/features/auth/domain/models/vehicle_model/vehicle_model_entity.dart';

abstract class VehicleEntity {
  final int id;
  final VehicleModelEntity model;
  final String vehicleLicenseNo;

  VehicleEntity({
    required this.id,
    required this.model,
    required this.vehicleLicenseNo,
  });
}
