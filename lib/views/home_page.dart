import 'package:flutter/material.dart';
import 'package:weather_app_v1/widgets/weather_widgets/coveredsun.dart';
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
  bool onpressed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List list = [
      Coveredsun(margin: margin1,),
      SunWidget(margin: margin1,),
      RainnyWidget(margin: margin1),
      SnowyWidget(margin: margin1)

    ];
    return Scaffold(
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
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '35ºC',
                  style: TextStyle(
                      fontSize: 40,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Sun & Rain',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              const Text(
                'Paris',
                style: TextStyle(color: Colors.grey, fontSize: 18),
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
                        const Icon(Icons.wb_sunny_outlined), 'Sunrise', '6.0'),
                    _mydivider(),
                    _bottomwidget(const Icon(Icons.wind_power_outlined),
                        'Wind speed', '6.0'),
                    _mydivider(),
                    _bottomwidget(
                        const Icon(Icons.alternate_email), 'Temp', '6.0'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                  onPressed: onpressed == false ? () => _setweather() : null,
                  child: const Text('Random'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _setweather() async {
    if (times < 2) {
      setState(() {
        onpressed = true;
        times += 1;
        if (margin1 == 100) {
          margin1 = 0;
        } else {
          margin1 = 100;
        }
      });
    } else {
      setState(() {
        onpressed = true;
        if (weather < 3) {
          weather += 1;
        } else {
          weather = 0;
        }
      });

      await Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          margin1 = 100;
          times = 1;
        });
      });
    }
    await Future.delayed(const Duration(seconds: 1), () {
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

  Column _bottomwidget(Icon icon1, String text1, String text2) {
    return Column(
      children: [
        icon1,
        Text(
          text1,
          style: const TextStyle(fontSize: 18),
        ),
        Text(text2, style: const TextStyle(fontSize: 18))
      ],
    );
  }
}
