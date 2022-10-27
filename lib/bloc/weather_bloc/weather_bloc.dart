import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_v1/bloc/weather_bloc/weather_event.dart';
import 'package:weather_app_v1/bloc/weather_bloc/weather_state.dart';
import 'package:weather_app_v1/models/exceptions/api_Exception.dart';
import 'package:weather_app_v1/models/weather_model.dart';
import 'package:weather_app_v1/repositories/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(StateinitialWeather()) {
    on<EventFetchWeather>((event, emit) async {
      emit(StateLoadingWeather());
      try {
        WeatherModel weather = await WeatherRepository.repoFetchWeather();
        if (weather.currentWeather!.weathercode != null) {
          switch (weather.currentWeather!.weathercode) {
            //0 sunny,1overcast,2raiiny,3lightinig,4snowy
            case 0:
            case 1:
              emit(StateLoadedWeather(0, weather));
              break;
            case 2:
            case 3:
            case 45:
            case 48:
              emit(StateLoadedWeather(1, weather));
              break;
            case 51:
            case 53:
            case 55:
            case 61:
            case 63:
            case 65:
            case 80:
            case 81:
            case 82:
              emit(StateLoadedWeather(2, weather));
              break;
            case 56:
            case 57:
            case 66:
            case 67:
            case 71:
            case 73:
            case 75:
            case 77:
            case 85:
            case 86:
              emit(StateLoadedWeather(4, weather));
              break;
            case 95:
            case 96:
            case 99:
              emit(StateLoadedWeather(3, weather));
              break;
          }
        }
      } on Apiexception catch (e) {
        emit(StateErrorWeather(e.message));
      }
    });
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
