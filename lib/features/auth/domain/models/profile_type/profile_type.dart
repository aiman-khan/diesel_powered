import 'package:diesel_powered/gen/assets.gen.dart';

enum ProfileTypeModel {
  driver,
  ownVehicle;

  int get id => switch (this) {
        driver => 1,
        ownVehicle => 2,
      };

  String get name => switch (this) {
        driver => 'Driver',
        ownVehicle => 'Own Vehicle',
      };

  String get svgPath => switch (this) {
        driver => Assets.svgs.driverIcon.path,
        ownVehicle => Assets.svgs.operatorIcon.path,
      };

  bool get isDriver => this == ProfileTypeModel.driver;
  bool get isOwnVehicle => this == ProfileTypeModel.ownVehicle;
}
