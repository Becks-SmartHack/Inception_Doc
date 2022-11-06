
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

Future<void> downloadApk () async {
  var dio = Dio();
  try {
    var response = await dio.download('http://192.168.22.141:3000', "/sdcard/download/a.txt");
    print(response);
  } catch (e) {
    print(e);
  }
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
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

