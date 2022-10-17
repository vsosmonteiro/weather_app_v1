import 'package:flutter/material.dart';
import 'package:weather_app_v1/widgets/weather_widgets/droplet_widget.dart';

class RainnyWidget extends StatefulWidget {
  RainnyWidget(
      {Key? key,
      required this.margin,
      required this.color,
      required this.margintop});

  int margin;
  double margintop;
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
          duration: const Duration(seconds: 2),
          width: 200,
          height: 200,
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icons/cloud.png')))),
        ),
        AnimatedContainer(
            duration: Duration(seconds: 2),
            margin: EdgeInsets.only(
                right:
                    widget.margin == 0 ? MediaQuery.of(context).size.width : 0),
            child: DropletWidget(2.5)),
        AnimatedContainer(
            duration: Duration(seconds: 2),
            margin: EdgeInsets.only(
                right:
                widget.margin == 0 ? MediaQuery.of(context).size.width : 40),
            child: DropletWidget(3.5)),
        AnimatedContainer(
            duration: Duration(seconds: 2),
            margin: EdgeInsets.only(
                right:
                widget.margin == 0 ? MediaQuery.of(context).size.width : 100),
            child: DropletWidget(4.5)),
        AnimatedContainer(
            duration: Duration(seconds: 2),
            margin: EdgeInsets.only(
                right:
                widget.margin == 0 ? MediaQuery.of(context).size.width : 140),
            child: DropletWidget(5.5)),
        AnimatedContainer(
            duration: Duration(seconds: 2),
            margin: EdgeInsets.only(
              left:widget.margin == 0?0:60 ,
                right:
                widget.margin == 0 ? MediaQuery.of(context).size.width : 0),
            child: DropletWidget(6.5)),
        AnimatedContainer(
            duration: Duration(seconds: 2),
            margin: EdgeInsets.only(
                left:widget.margin == 0?0:100 ,
                right:
                widget.margin == 0 ? MediaQuery.of(context).size.width : 0),
            child: DropletWidget(7.5))


      ],
    );
  }

  @override
  void setState(VoidCallback fn) {
    if (widget.margintop == 20) {
      widget.margintop = 0;
      print('aa');
    } else {
      widget.margintop = 20;
    }
    super.setState(fn);
  }
}
