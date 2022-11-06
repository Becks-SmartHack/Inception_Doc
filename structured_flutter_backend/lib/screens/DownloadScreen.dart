
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 30,),
            onPressed: () =>  Navigator.of(context).pop(),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Image.asset('assets/Component3.png'),
              alignment: Alignment.topLeft,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Application generated successfully!",
                        style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),

            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
                    'assets/Asset 5@4x.png',
                    width: width/2),

              ]),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Click here to download",
                        style: TextStyle(
                            fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.amber[900]),
                    ),
                  ],
                ),
              ],
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
        )
    );

  }
}

