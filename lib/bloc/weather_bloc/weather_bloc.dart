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
      try{
          WeatherModel weather= await WeatherRepository.repoFetchWeather();
          if(weather.currentWeather!.weathercode != null)
            {
              switch (weather.currentWeather!.weathercode){
                case 0:
                  break;

              }
            }

      }
      on Apiexception catch (e){

      }
    });
  }
}
