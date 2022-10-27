import 'package:dio/dio.dart';
import 'package:weather_app_v1/models/exceptions/api_Exception.dart';

abstract class WeatherService {
  static Future<Map<String, dynamic>> fetchWeather() async {
    try {
      Response response = await Dio().get(
          'https://api.open-meteo.com/v1/forecast?latitude=-9.66&longitude=-35.70&current_weather=true');
        return response.data as Map<String, dynamic>;
    } on DioError catch (e) {
      if(e.response !=null)
        {
          throw Apiexception(code: e.response?.statusCode,message: e.message);
        }
      throw Apiexception(code: 999,message: 'Error sending request');
    }
  }
}

//"https://api.open-meteo.com/v1/forecast?latitude=-9.66&longitude=-35.70&current_weather=true"
