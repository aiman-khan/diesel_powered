import 'package:diesel_powered/features/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:diesel_powered/infrastructure/datasource.dart';

abstract class WeatherRemoteDataSource extends DataSource {
  Future<GetCurrentWeatherUsecaseOutput> getCurrentWeather(
      GetCurrentWeatherUsecaseInput input);
}
