import 'package:flutter/material.dart';
import 'LoginScreen.dart';

class StartScreen extends StatelessWidget {
  static const routName = "/start";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to Inception Doc'),
            Image.asset('assets/logo.jpeg', width: 300, height: 300),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(LoginScreen.routName);
          }
      ),
    );
  }
}