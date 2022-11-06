import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:structured_flutter_backend/screens/splash.dart';

class LoginPage extends StatefulWidget{
  const LoginPage ({Key? key, required this.title}) : super (key: key);
  final String title;

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage  extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {

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
                  'assets/Component3.png',
                )
              ],
            ),
            Text(
              'Let’s get you in',
              selectionColor: Color.fromRGBO(28, 35, 33, 1),
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w600
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(37, 0, 37, 0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color.fromRGBO(48, 131, 220, 0.2),)
                    ),
                    hintText: 'Email',
                    fillColor: Color.fromRGBO(48, 131, 220, 0.2),
                  ),
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/Component4.png',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}