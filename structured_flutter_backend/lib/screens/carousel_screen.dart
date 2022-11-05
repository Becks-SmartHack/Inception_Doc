

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:structured_flutter_backend/screens/appFeatures_screen.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({Key? key}) : super(key: key);

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(

        title: Text("Carousel screen"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: height/2,
                enlargeCenterPage: false,
                viewportFraction: 2.0

              ),
              items: [1,2,3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                            width: MediaQuery.of(context).size.width/1.2,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                            child:
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Image.network('https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),

                                ),
                                onTap: () {
                                  Navigator.push<Widget>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AppFeaturesScreen(),
                                    ),
                                  );}


                              )
                        );

                  },
                );
              }).toList(),
            )
          ],
        ),
      ),

    );

  }
}
