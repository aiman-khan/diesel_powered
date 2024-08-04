import 'package:diesel_powered/features/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:diesel_powered/infrastructure/repository.dart';

abstract class WeatherRepository extends Repository {
  Future<GetCurrentWeatherUsecaseOutput> getCurrentWeather(
      GetCurrentWeatherUsecaseInput input);
}
