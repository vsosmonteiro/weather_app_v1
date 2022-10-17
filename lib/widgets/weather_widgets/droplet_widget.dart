import 'dart:math';

import 'package:flutter/material.dart';

class DropletWidget extends StatefulWidget {
DropletWidget(this.offset);
late double offset;
  @override
  State<DropletWidget> createState() => _DropletWidgetState();
}

class _DropletWidgetState extends State<DropletWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }
  late final AnimationController _controller = AnimationController(
    duration:  Duration(seconds: Random().nextInt(4)+1),
    vsync: this,
  )..repeat();
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset(0,-widget.offset),
    end:  Offset(0, 6-widget.offset),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));




  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position:_offsetAnimation,
      child: Container(
        height: 14,
        width: 2,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.blue),
      ),
    );
  }
}
