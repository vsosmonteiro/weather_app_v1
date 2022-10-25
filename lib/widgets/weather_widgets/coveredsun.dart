import 'package:flutter/material.dart';

class Coveredsun extends StatefulWidget {
  Coveredsun({Key? key, required this.margin}) : super(key: key);

  @override
  State<Coveredsun> createState() => _CoveredsunState();
  int margin;
}

class _CoveredsunState extends State<Coveredsun> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 135.0),
      child: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 2),
            margin: EdgeInsets.only(
                right:
                    widget.margin == 0 ? MediaQuery.of(context).size.width : 0),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/sunny.png'),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 2),
            margin: EdgeInsets.only(top: 18,
                left: widget.margin == 0 ? MediaQuery.of(context).size.width : 20 ),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/newcloud.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
