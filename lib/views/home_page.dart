import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_v1/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_app_v1/bloc/weather_bloc/weather_event.dart';
import 'package:weather_app_v1/bloc/weather_bloc/weather_state.dart';
import 'package:weather_app_v1/models/weather_model.dart';
import 'package:weather_app_v1/widgets/weather_widgets/coveredsun.dart';
import 'package:weather_app_v1/widgets/weather_widgets/lightning_widget.dart';
import 'package:weather_app_v1/widgets/weather_widgets/rainny_widget.dart';
import 'package:weather_app_v1/widgets/weather_widgets/snowy_widget.dart';
import 'package:weather_app_v1/widgets/weather_widgets/sun_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int margin1 = 0;
  int weather = 0;
  int times = 0;
  bool isNotAnimating = true;
  bool onpressed = false;
  double temperature=22;
  double windspeed=10;
  String weatherStatus='Sunny';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List list = [
      SnowyWidget(margin: margin1),
      Coveredsun(
        margin: margin1,
      ),
      RainnyWidget(margin: margin1),
      LightningWidget(margin: margin1),
      SunWidget(
        margin: margin1,
      )
    ];
    return BlocListener<WeatherBloc, WeatherState>(
      listenWhen: (previous, next) => previous != next,
      listener: (context, state) {
        if (state is StateLoadingWeather) {
          print('loading');
        }
        if (state is StateLoadedWeather) {
          print('loaded');

          _setWeatherWithBloc(state.weathercode,state.weather);

        }
        if (state is StateErrorWeather) {}
      },
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 48, bottom: 1),
                  child: Text(
                    'Maceió',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'Segunda,11:35 da manhã',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 0),
                  child: list[weather],
                ),
                 Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '$temperatureº',
                    style: const TextStyle(
                        fontSize: 40,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    weatherStatus,
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: 48,
                    child: const Divider(
                      thickness: 2,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _bottomwidget(
                          'assets/icons/sunrise.png', 'Sunrise', '06:23'),
                      _mydivider(),
                      _bottomwidget(
                          'assets/icons/windy.png', 'Wind speed', windspeed.toString()+' km/h'),
                      _mydivider(),
                      _bottomwidget(
                          'assets/icons/high-temperatures.png', 'Temp', temperature.toString()+'º'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton(
                    onPressed: onpressed == false ? () => _setweather() : null,
                    child: const Text('Next'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton(
                    onPressed: onpressed == false ? () {
                      context.read<WeatherBloc>()..add(EventFetchWeather());
                    }:null,
                    child: const Text('Current weather'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //setweather(2)
  void _setweather() async {
    if (isNotAnimating) {
      isNotAnimating = false;
      setState(() {
        onpressed = true;
        margin1 = 100;
      });
    } else {
      setState(() {
        onpressed = true;
        isNotAnimating = true;
        margin1 = 0;
      });
      await Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          if(weather<4)
            {
              weather += 1;

            }
          else
            {
              weather=0;
            }
        });
      });
    }

    await Future.delayed(const Duration(milliseconds: 1600), () {
      setState(() {
        onpressed = false;
      });
    });
  }

  Container _mydivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      height: 32,
      width: 2,
      color: Colors.blueGrey,
    );
  }

  Column _bottomwidget(String asset, String text1, String text2) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage(asset))),
        ),
        Text(
          text1,
          style: const TextStyle(fontSize: 18),
        ),
        Text(text2, style: const TextStyle(fontSize: 18))
      ],
    );
  }

  void _setWeatherWithBloc(int weathercode,WeatherModel weathermodel) async {
    setState(() {
      temperature=weathermodel.currentWeather!.temperature!;
      windspeed=weathermodel.currentWeather!.windspeed!;

    });
    if (isNotAnimating) {
      setState(() {
        isNotAnimating=false;
        weather = weathercode;
        switch(weather){
          case 0:
            weatherStatus='Snowy';
            break;
          case 1:
            weatherStatus='Overcast';
            break;
          case 2:
            weatherStatus='Raining';
            break;
          case 3:
            weatherStatus='Thunderstorm';
          break;
          case 4:
            weatherStatus='Sunny';
            break;
        }
        print('b');
        onpressed = true;
      });
      await Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          margin1 = 100;
        });
      });
      await Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          onpressed = false;
        });
      });
    } else {
      setState(() {
        isNotAnimating=true;
        margin1=0;
      });

    }
  }
}
