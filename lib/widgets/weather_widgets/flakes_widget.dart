import 'package:flutter/material.dart';

class FlakeWidget extends StatefulWidget {
  const FlakeWidget({Key? key}) : super(key: key);

  @override
  State<FlakeWidget> createState() => _FlakeWidgetState();
}

class _FlakeWidgetState extends State<FlakeWidget> {
  int animationTime = 0;
  double margin = 0;

  @override
  void initState() {
    _recursion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: animationTime),
      width: 20,
      height: 20,
      decoration:  const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/icons/snowflake.png'),
        ),
      ),
      margin: EdgeInsets.only(top: margin, bottom: 60 - margin),
    );
  }

  void _recursion() async {
    await Future.delayed(const Duration(milliseconds: 20), () {
      if (mounted) {
        setState(
          () {
            margin = margin + 1;
            if (margin == 60) {
              margin = 0;
            }
            _recursion();
          },
        );
      }
    });
  }
}
