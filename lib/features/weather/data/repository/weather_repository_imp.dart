import 'package:diesel_powered/features/weather/domain/data/weather_remote_datasource.dart';
import 'package:diesel_powered/features/weather/domain/repository/weather_repository.dart';
import 'package:diesel_powered/features/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WeatherRepositoryImp)
class WeatherRepositoryImp implements WeatherRepository {
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  WeatherRepositoryImp({
    required WeatherRemoteDataSource weatherRemoteDataSource,
  }) : _weatherRemoteDataSource = weatherRemoteDataSource;

  @override
  Future<GetCurrentWeatherUsecaseOutput> getCurrentWeather(
      GetCurrentWeatherUsecaseInput input) {
    return _weatherRemoteDataSource.getCurrentWeather(input);
  }
}
