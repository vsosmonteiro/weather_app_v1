import 'package:flutter/material.dart';

class RainnyWidget extends StatefulWidget {
  RainnyWidget({Key? key, required this.margin, required this.color});

  final int margin;
  Color color;

  @override
  State<RainnyWidget> createState() => _RainnyWidgetState();
}

class _RainnyWidgetState extends State<RainnyWidget> {
  @override

  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/icons/cloud.png'))),
      margin: EdgeInsets.only(
          right: widget.margin == 0 ? MediaQuery.of(context).size.width : 0),
      duration: const Duration(seconds: 3),
      width: 100,
      height: 100,
    );
  }
}
