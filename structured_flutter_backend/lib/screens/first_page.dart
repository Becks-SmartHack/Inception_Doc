import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:structured_flutter_backend/screens/splash.dart';

class FirstPage extends StatefulWidget{
  const FirstPage ({Key? key, required this.title}) : super (key: key);
  final String title;

  @override
  State<FirstPage> createState() => _FirstPage();
}

List<ContentConfig> createSlides() {
  List<ContentConfig> slides = [];

  slides.add(
    ContentConfig(
      widgetTitle: Text('Welcome')
    )
  );

  return slides;
}

class _FirstPage  extends State<FirstPage>{
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/cerc4.png',
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
            Container(
                alignment: Alignment.center,
                width: 275,
                height: 150,
                child: Image.asset('assets/logo.png'),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: _width,
                      child: Image.asset(
                        'assets/cerc3.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
                // IntroSlider(
                //   key: UniqueKey(),
                //   listContentConfig: createSlides(),
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}