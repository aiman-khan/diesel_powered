import 'package:calculator_flutter_app/features/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:calculator_flutter_app/infrastructure/repository.dart';

abstract class WeatherRepository extends Repository {
  Future<GetCurrentWeatherUsecaseOutput> getCurrentWeather(
      GetCurrentWeatherUsecaseInput input);
}
