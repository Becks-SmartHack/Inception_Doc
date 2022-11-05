

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
      resizeToAvoidBottomInset : false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset('assets/Component3.png'),
              alignment: Alignment.topLeft,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: height/2,
                  enlargeCenterPage: true,
                  viewportFraction: 2.0,
                ),
                items: [0,1,2].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                              width: MediaQuery.of(context).size.width/1.2,
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent.withOpacity(0.3),
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                              ),
                              child:
                                Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                      child: Text(
                                          "Doctor",
                                      style: TextStyle(
                                        fontSize:25,
                                      ),),

                                    ),
                                    GestureDetector(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: imgList[i],
                                      ),
                                      onTap: () {
                                        Navigator.push<Widget>(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AppFeaturesScreen(),
                                          ),
                                        );}
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "50€",
                                      style: TextStyle(
                                       fontSize: 20
                                      ),),
                                    ),
                                  ],
                                )
                          );
                    },
                  );
                }).toList(),
              ),
            ),
            // Padding(padding: EdgeInsets.fromLTRB(0, 118, 0, 0)),
            Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomRight,
                  child: Image.asset('assets/Component4.png'),
                ),
              ),
          ],
        ),
      );

  }
}

List imgList = [
  Image.asset('assets/1663779989005 1.png'),
  Image.asset('assets/consult-rezidenti-blog- 1.png'),
  Image.asset('assets/spital-generic-shutterstock 1.png'),
];
