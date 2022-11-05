import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatefulWidget {
  const Splash ({Key? key, required this.title}) : super (key: key);
  final String title;

  @override
  State<Splash> createState() => _Splash();
}

class _Splash extends State<Splash> with TickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState () {
    controller = AnimationController(
      vsync: this,
    )..addListener(() {
      setState (() {});
    });

    super.initState ();
    // _navigateHome ();
  }

  // void _navigateHome() async {
  //   await Future.delayed (Duration (seconds: 5));
  //   Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => MyHomePage (
  //             title: 'Home Page',
  //             speak_blocked: false,
  //           )
  //       )
  //   );
  // }

  @override
  void dispose () {
    controller.dispose();
    super.dispose();
  }

  Widget generatePage (context) {
      return Scaffold(
          backgroundColor: Colors.greenAccent,
          body: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text (
                  "Ana are mere"
              ),
              Padding(padding: EdgeInsets.all(50)),
              Text (
                  "Ana are pere"
              ),
              Padding(padding: EdgeInsets.all(50)),
              SpinKitPouringHourGlassRefined (
                color: Colors.white,
                size: 200,
              ),
              Padding(padding: EdgeInsets.all(50)),
              Text (
                  "tractor"
              ),
            ],
          )
      );
  }

  @override
  Widget build(BuildContext context) {
    return generatePage(context);
  }
}