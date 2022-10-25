import 'package:flutter/material.dart';

class SunWidget extends StatefulWidget {
  int margin;

  SunWidget({super.key, required this.margin});

  @override
  State<SunWidget> createState() => _SunWidgetState();
}

class _SunWidgetState extends State<SunWidget> {
  double shadowsize = 0;
  bool isGrowing = true;

  @override
  void initState() {
    _recursion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20,bottom: 135),
          child: AnimatedContainer(
              margin: EdgeInsets.only(right:
              widget.margin==0?MediaQuery.of(context).size.width+100 :0),
            duration: const Duration(seconds: 1),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
                border: Border.all(color: Colors.black, width: 10),
                boxShadow: widget.margin==0?[]:[
                  BoxShadow(
                      color: Colors.yellow, spreadRadius: shadowsize),
                  const BoxShadow(
                      color: Colors.white,
                      spreadRadius: 10,
                      offset: Offset(0, 0)),
                ]),
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }

  void _recursion() {
    Future.delayed(const Duration(milliseconds: 30), () {
      if (mounted) {
        setState(() {
          if (shadowsize < 60 && isGrowing) {
            shadowsize += 1;
          } else {
            shadowsize -= 1;
            isGrowing = false;
            if (shadowsize == 0) {
              isGrowing = true;
            }
          }
        });
        _recursion();
      }
    });
  }
}
