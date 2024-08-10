import 'package:calculator_flutter_app/features/weather/domain/models/weather/weather_model.dart';
import 'package:calculator_flutter_app/features/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:calculator_flutter_app/features/weather/presentation/providers/user_current_location_provider.dart';
import 'package:calculator_flutter_app/util/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCurrentWeatherProvider =
    FutureProvider.autoDispose<WeatherModel>((ref) async {
  final currentWeather = sl<GetCurrentWeatherUsecase>();
  final currentLocation = ref.watch(userCurrentLocationProvider);
  final input = GetCurrentWeatherUsecaseInput(
    lat: currentLocation!.latitude,
    lng: currentLocation.longitude,
  );
  final output = await currentWeather(input);
  return output.weather;
});
