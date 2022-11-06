import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:structured_flutter_backend/CarouselSlider2.dart';
import 'package:structured_flutter_backend/Patient.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'PatientCell.dart';

class HomeScreen extends StatelessWidget {
  List<Patient> patientList = [
    new Patient("Marcel Marcel", 50, "Are afectiuni la cap"),
    new Patient("Marcel Marcel2", 51, "Are afectiuni la cap"),
    new Patient("Marcel Marcel3", 52, "Are afectiuni la cap"),
    new Patient("Marcel Marcel4", 53, "Are afectiuni la cap"),
    new Patient("Marcel Marcel5", 54, "Are afectiuni la cap"),
  ];

  List<PatientCell> patientCellsList = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    for (Patient patient in patientList) {
      patientCellsList
          .add(new PatientCell(width: width, height: height, patient: patient));
    }

    return Scaffold(
      body: Container(
          //child: CarouselSlider2(listItems: patientCellsList),
          child: Column(
        children: [
          Container(
            height: 0.45 * height,
            width: width,
            alignment: Alignment.topRight,
            child: Stack(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Image.asset('assets/elipse.png'),
                ]),
                Container(
                  alignment: Alignment.topRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            "assets/om.png",
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(width: 20)
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: Positioned(
                              top: 30,
                              right: 10,
                              child: Text(
                                "Welcome",
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: Positioned(
                              top: 10,
                              right: 10,
                              child: Text(
                                "back,",
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: Positioned(
                                top: 10,
                                right: 10,
                                child: Text(
                                  "DR. Becks++",
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              height: 0.15 * height,
              alignment: Alignment.center,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 0.1 * width),
                    Text("Today's",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 0.1 * width),
                    Text("appointment",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ])),
          Container(
            height: 0.25 * height,
            alignment: Alignment.center,
            child: CarouselSlider(
              options: CarouselOptions(
                height: height / 2,
                enlargeCenterPage: true,
                viewportFraction: 2.0,
              ),
              items: patientCellsList,
            ),
          )
        ],
      )),
    );
  }
}
