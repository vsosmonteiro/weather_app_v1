import 'package:flutter/material.dart';
import 'package:weather_app_v1/widgets/weather_widgets/droplet_widget.dart';

class RainnyWidget extends StatefulWidget {
  RainnyWidget({
    Key? key,
    required this.margin,
    required this.color,
  });

  int margin;
  Color color;

  @override
  State<RainnyWidget> createState() => _RainnyWidgetState();
}

class _RainnyWidgetState extends State<RainnyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          margin: EdgeInsets.only(
              right:
                  widget.margin == 0 ? MediaQuery.of(context).size.width : 0),
          duration: const Duration(seconds: 1),
          width: 200,
          height: 120,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/newcloud.png'),
              ),
            ),
          ),
        ),
        AnimatedContainer(
            duration: Duration(seconds: 1),
            margin: EdgeInsets.only(
                right:
                    widget.margin == 0 ? MediaQuery.of(context).size.width : 0),
            child: DropletWidget(2.5)),
        AnimatedContainer(
            duration: Duration(seconds: 1),
            margin: EdgeInsets.only(
                right: widget.margin == 0
                    ? MediaQuery.of(context).size.width
                    : 30),
            child: DropletWidget(3.5)),
        AnimatedContainer(
            duration: Duration(seconds: 1),
            margin: EdgeInsets.only(
                right: widget.margin == 0
                    ? MediaQuery.of(context).size.width
                    : 80),
            child: DropletWidget(4.5)),
        AnimatedContainer(
            duration: Duration(seconds: 1),
            margin: EdgeInsets.only(
                right: widget.margin == 0
                    ? MediaQuery.of(context).size.width
                    : 100),
            child: DropletWidget(5.5)),
        AnimatedContainer(
            duration: Duration(seconds: 1),
            margin: EdgeInsets.only(
                left: widget.margin == 0 ? 0 : 60,
                right:
                    widget.margin == 0 ? MediaQuery.of(context).size.width : 0),
            child: DropletWidget(6.5)),
        AnimatedContainer(
            duration: Duration(seconds: 1),
            margin: EdgeInsets.only(
                left: widget.margin == 0 ? 0 : 100,
                right:
                    widget.margin == 0 ? MediaQuery.of(context).size.width : 0,
                bottom: 50),
            child: DropletWidget(7.5))
      ],
    );
  }
}
