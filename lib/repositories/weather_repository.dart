import 'package:weather_app_v1/models/weather_model.dart';
import 'package:weather_app_v1/services/weather_service.dart';

abstract class WeatherRepository{
  static Future<WeatherModel> repoFetchWeather()async
  {
    Map<String,dynamic> response = await WeatherService.fetchWeather();
    WeatherModel weather= WeatherModel.fromJson(response);

    return weather;
  }

}
