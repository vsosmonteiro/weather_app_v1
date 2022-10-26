import 'package:dio/dio.dart';
import 'package:weather_app_v1/models/exceptions/api_Exception.dart';

class WeatherService {
  Future<Map<String, dynamic>> fetchWeather() async {
    Response response = await Dio().get(
        'https://api.open-meteo.com/v1/forecast?latitude=-9.66&longitude=-35.70&current_weather=true');
    print(response.data);
    if (response.statusCode != 200) {
      throw Apiexception(
          code: response.statusCode, message: response.statusMessage);
    }
    else {
      return response.data as Map<String, dynamic>;
    }
  }
}

//"https://api.open-meteo.com/v1/forecast?latitude=-9.66&longitude=-35.70&current_weather=true"
