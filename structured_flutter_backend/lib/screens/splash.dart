import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:structured_flutter_backend/main.dart';

class Splash extends StatefulWidget {
  const Splash ({Key? key, required this.title}) : super (key: key);
  final String title;

  @override
  State<Splash> createState() => _Splash();
}

class _Splash extends State<Splash> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 3), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceIn);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                  'assets/cerc1.png',
                width: 200,
                height: 200,
              )
            ],
          ),
          // Padding(padding: EdgeInsets.fromLTRB(0, 83, 0, 0)),
          Container(
            alignment: Alignment.center,
            width: 275,
            height: 185,
            child:ScaleTransition(
              scale: _animation,
              alignment: Alignment.center,
              child: Image.asset('assets/logo.png'),
            )
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/cerc2.png',
                height: 200,
                width: _width,
              ),
            ],
          )
        ],
      ),
    );
  }
}