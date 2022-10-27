import 'package:equatable/equatable.dart';

class WeatherState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class StateinitialWeather extends WeatherState{}
class StateLoadingWeather extends WeatherState{}
class StateLoadedWeather extends WeatherState{}
class StateErrorWeather extends WeatherState{
  final String message;
  StateErrorWeather(this.message);
}
