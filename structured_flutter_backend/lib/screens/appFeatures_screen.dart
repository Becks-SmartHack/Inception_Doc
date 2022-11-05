import 'package:flutter/material.dart';

class AppFeaturesScreen extends StatefulWidget {
  const AppFeaturesScreen({Key? key}) : super(key: key);

  @override
  State<AppFeaturesScreen> createState() => _AppFeaturesScreenState();
}

class _AppFeaturesScreenState extends State<AppFeaturesScreen> {
  bool? _valueAddPacientList = false;
  bool? _valueAddPrescription = false;
  bool pressedButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Container(
          child: Image.asset('assets/Component3.png'),
          alignment: Alignment.topLeft,
        ),

        Container(
            padding: EdgeInsets.all(18.0),
            alignment: Alignment.centerRight,
            child: Text.rich(
              TextSpan(
                  text: 'What features do you need?',
                  style: TextStyle(
                    fontSize: 35.0,
                  ),
                  children: [
                    WidgetSpan(
                      child: GestureDetector(
                        child: Icon(
                          Icons.info_outlined,
                          color: Colors.black,
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(

                                backgroundColor: Colors.lightBlue[700],
                                  content: Text("Sign In, Log In and Patients List are mandatory for your application. "
                                      "Now, depending on the desired features, additional costs may apply.",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                  actions: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () => Navigator.pop(context, true) ),
                                    )
                      
                                  ]);
                            },
                          );
                        }

                      ),
                    ),
                  ]),
            )),

        Expanded(
          child: ListView(
            children: [
              CheckboxListTile(
                title: const Text('Sign in', style: TextStyle(fontSize: 25)),
                subtitle: const Text("User will be able to create an account",
                    style: TextStyle(fontSize: 15)),
                value: true,
                onChanged: null,
              ),
              CheckboxListTile(
                title: const Text('Log in', style: TextStyle(fontSize: 25)),
                subtitle: const Text(
                    "User will be able to log in into an existing account",
                    style: TextStyle(fontSize: 15)),
                value: true,
                onChanged: null,
              ),
              CheckboxListTile(
                  title: const Text('Pacients List',
                      style: TextStyle(fontSize: 25)),
                  subtitle: const Text(
                      "User will be able to see his patients and their details",
                      style: TextStyle(fontSize: 15)),
                  value: _valueAddPacientList,
                  onChanged: (bool? value) {
                    setState(() {
                      _valueAddPacientList = value;
                    });
                  }),
              CheckboxListTile(

                  title: const Text('Add prescription',
                      style: TextStyle(fontSize: 25)),
                  subtitle: const Text(
                      "User will be able to add the prescription and the diagnostic given to his patient",
                      style: TextStyle(fontSize: 15)),
                  value: _valueAddPrescription,
                  onChanged: (bool? value) {
                    setState(() {
                      _valueAddPrescription = value;
                    });
                  }),
            ],
          ),
        ),


        SizedBox(
            height: 25,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 5,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    content: Text("Your app has been generated!"),
                    actions: [
                      TextButton(
                        child: Text("Continue"),
                        onPressed: () => Navigator.pop(context, true),
                      )
                    ]);
              },
            );
          },
          child: Text('Generate app'),
        ),

        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomRight,
            child: Image.asset('assets/Component4.png'),
          ),
        ),
      ]),
    );
  }
}
