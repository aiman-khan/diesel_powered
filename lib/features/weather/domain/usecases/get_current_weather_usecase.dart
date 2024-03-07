import 'package:diesel_powered/features/weather/domain/models/weather/weather_model.dart';
import 'package:diesel_powered/features/weather/domain/repository/weather_repository.dart';
import 'package:diesel_powered/infrastructure/usecase.dart';
import 'package:diesel_powered/infrastructure/usecase_input.dart';
import 'package:diesel_powered/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class GetCurrentWeatherUsecaseInput extends Input {
  GetCurrentWeatherUsecaseInput({
    required this.lat,
    required this.lng,
  });

  final double lat;
  final double lng;
}

class GetCurrentWeatherUsecaseOutput extends Output {
  GetCurrentWeatherUsecaseOutput({required this.weather});

  final WeatherModel weather;
}

@lazySingleton
class GetCurrentWeatherUsecase extends Usecase<GetCurrentWeatherUsecaseInput,
    GetCurrentWeatherUsecaseOutput> {
  final WeatherRepository _weatherRepository;

  GetCurrentWeatherUsecase({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  @override
  Future<GetCurrentWeatherUsecaseOutput> call(
      GetCurrentWeatherUsecaseInput input) async {
    return await _weatherRepository.getCurrentWeather(input);
  }
}
