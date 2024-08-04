import 'package:diesel_powered/features/weather/domain/data/weather_remote_datasource.dart';
import 'package:diesel_powered/features/weather/domain/models/weather/weather_model.dart';
import 'package:diesel_powered/features/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:diesel_powered/helpers/network_call_helper/network_call_helper.dart';
import 'package:diesel_powered/util/consts/api.dart';
import 'package:diesel_powered/util/consts/keys.dart';
import 'package:diesel_powered/util/exceptions/message_exception.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImp implements WeatherRemoteDataSource {
  final Logger _logger;
  final NetworkCallHelper _networkCallHelper;

  WeatherRemoteDataSourceImp({
    required Logger logger,
    required NetworkCallHelper networkCallHelper,
  })  : _logger = logger,
        _networkCallHelper = networkCallHelper;

  @override
  Future<GetCurrentWeatherUsecaseOutput> getCurrentWeather(
      GetCurrentWeatherUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response =
          await _networkCallHelper.get(Apis.currentWeather, params: {
        "lat": input.lat,
        "lon": input.lng,
        "appId": weatherApiKey,
      });

      final data = WeatherModel.fromJson(response);

      return GetCurrentWeatherUsecaseOutput(weather: data);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT getCurrentWeather: $e");
      throw SomethingWentWrongException();
    }
  }
}
