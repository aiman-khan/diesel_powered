import 'package:calculator_flutter_app/features/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:calculator_flutter_app/infrastructure/datasource.dart';

abstract class WeatherRemoteDataSource extends DataSource {
  Future<GetCurrentWeatherUsecaseOutput> getCurrentWeather(
      GetCurrentWeatherUsecaseInput input);
}
