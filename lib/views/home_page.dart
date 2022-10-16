import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 96, bottom: 1),
                child: Text(
                  'Maceio',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                'Segunda,11:35 da manhã',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 32.0, bottom: 32),
                child: Icon(
                  Icons.sunny,
                  size: 160,
                  color: Colors.yellow,
                ),
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
                margin: EdgeInsets.symmetric(vertical: 8),
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
                        Icon(Icons.wb_sunny_outlined), 'Sunrise', '6.0'),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      height: 32,
                      width: 2,
                      color: Colors.blueGrey,
                    ),
                    _bottomwidget(Icon(Icons.wind_power_outlined), 'Wind speed', '6.0'),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      height: 32,
                      width: 2,
                      color: Colors.blueGrey,
                    ),
                    _bottomwidget(Icon(Icons.alternate_email), 'Temp', '6.0'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: _bottomwidget(Icon(Icons.shuffle,size: 40,), 'Random', ''),
              )
            ],
          ),
        ),
      ),
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
