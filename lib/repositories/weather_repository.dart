import 'package:weather_app_v1/models/weather_model.dart';
import 'package:weather_app_v1/services/weather_service.dart';

class WeatherRepository{
  final WeatherService _service = WeatherService();
  Future<WeatherModel> repoFetchWeather()async
  {
    Map<String,dynamic> response = await _service.fetchWeather();
    WeatherModel weather= WeatherModel.fromJson(response);

    return weather;
  }

}
/*
Code	Description
0	Clear sky
1, 2, 3	Mainly clear, partly cloudy, and overcast
45, 48	Fog and depositing rime fog
51, 53, 55	Drizzle: Light, moderate, and dense intensity
56, 57	Freezing Drizzle: Light and dense intensity
61, 63, 65	Rain: Slight, moderate and heavy intensity
66, 67	Freezing Rain: Light and heavy intensity
71, 73, 75	Snow fall: Slight, moderate, and heavy intensity
77	Snow grains
80, 81, 82	Rain showers: Slight, moderate, and violent
85, 86	Snow showers slight and heavy
95 *	Thunderstorm: Slight or moderate
96, 99 *	Thunderstorm with slight and heavy hail*/