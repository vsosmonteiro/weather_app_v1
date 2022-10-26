import 'package:flutter/material.dart';

class LightningWidget extends StatefulWidget {
  LightningWidget({Key? key, required this.margin}) : super(key: key);
  int margin;

  @override
  State<LightningWidget> createState() => _LightningWidgetState();
}

class _LightningWidgetState extends State<LightningWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double opacity = 1;

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 140.0),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        margin: EdgeInsets.only(
            right: widget.margin == 0
                ? MediaQuery.of(context).size.width + 30
                : 0),
        child: Column(
          children: [
            Container(
              height: 90,
              width: 140,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/newcloud.png'),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 150, minWidth: 0,minHeight: 24),
              child: widget.margin == 0
                  ? null
                  : FadeTransition(
                      opacity: _animation,
                      child: Row(
                        children: const [
                          Expanded(
                            child: Icon(
                              Icons.flash_on,
                              color: Colors.yellow,
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              Icons.flash_on,
                              color: Colors.yellow,
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              Icons.flash_on,
                              color: Colors.yellow,
                            ),
                          )
                        ],
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
