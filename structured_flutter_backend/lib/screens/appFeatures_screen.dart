

import 'package:flutter/material.dart';

class AppFeaturesScreen extends StatefulWidget {
  const AppFeaturesScreen({Key? key}) : super(key: key);

  @override
  State<AppFeaturesScreen> createState() => _AppFeaturesScreenState();
}

class _AppFeaturesScreenState extends State<AppFeaturesScreen> {
  bool? _value = false;
  bool pressedButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Features list"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[ CheckboxListTile(
            title: const Text('Login form'),
            value: true,
        onChanged: null,),

          CheckboxListTile(
            title: const Text('Register form'),
            value: true,
            onChanged: null),

          CheckboxListTile(
              title: const Text('Pacient list'),
              value: _value,
              onChanged: (bool? value){
                setState(() {
                  _value = value;
                });
              }),

          ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: 2),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Text("Your app has been generated!"),
                    actions:[
                  TextButton(
                  child: Text("Continue"),
                  onPressed: () => Navigator.pop(context, true),
                  )
                    ]
                  );
                },
              );
            },
            child: Text('Generate app'),
          )

        ]


      ),
    );
  }
}
