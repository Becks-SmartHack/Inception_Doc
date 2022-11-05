
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Image.asset('assets/Component3.png'),
                alignment: Alignment.topLeft,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Generating your application",
                    style: TextStyle(fontSize: 30)),
              ),


              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                      'assets/Asset 5@4x.png',
                      width: width/2),

                ]),
              ),



              Container(
                width: width,
                alignment: Alignment.bottomRight,
                child: Stack(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Image.asset('assets/Component4.png'),
                  ]),

                ]),
              ),
            ],
          ),
        )

    );
  }
}
