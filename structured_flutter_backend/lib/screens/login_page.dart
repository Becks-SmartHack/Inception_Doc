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

    return Scaffold();
  }
}