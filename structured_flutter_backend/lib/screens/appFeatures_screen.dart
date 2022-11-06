import 'package:flutter/material.dart';
import 'package:structured_flutter_backend/screens/AddHospitalLogoScreen.dart';


class AppFeaturesScreen extends StatefulWidget {
  const AppFeaturesScreen({Key? key}) : super(key: key);

  @override
  State<AppFeaturesScreen> createState() => _AppFeaturesScreenState();
}

class _AppFeaturesScreenState extends State<AppFeaturesScreen> {
  bool _valueAddPrescription = false;
  bool pressedButton = false;


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body:
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
        Container(
          child: Image.asset('assets/Component3.png'),
          alignment: Alignment.topLeft,
        ),
        Container(
            padding: EdgeInsets.all(18.0),
            alignment: Alignment.centerRight,
            child: Text.rich(
              TextSpan(
                  text: 'Who are you building your application for?',
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
                                    content: Text(
                                      "Sign In, Log In and Patients List are mandatory for your application. "
                                      "Now, depending on the desired features, additional costs may apply.",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    actions: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                            icon: Icon(Icons.close),
                                            onPressed: () =>
                                                Navigator.pop(context, true)),
                                      )
                                    ]);
                              },
                            );
                          }),
                    ),
                  ]),
            )),
        Expanded(
          child: ListView(
            children: [
              SwitchListTile(
                activeColor: Colors.amber[900],
                title: const Text('Sign in', style: TextStyle(fontSize: 25)),
                subtitle: const Text("User will be able to create an account\n"
                    "FREE",
                    style: TextStyle(fontSize: 15)),
                value: true,
                onChanged: null,
              ),
              SwitchListTile(
                activeColor: Colors.amber[900],
                title: const Text('Log in', style: TextStyle(fontSize: 25)),
                subtitle: const Text(
                    "User will be able to log in into an existing account\n"
                        "FREE",
                    style: TextStyle(fontSize: 15)),
                value: true,
                onChanged: null,
              ),
              SwitchListTile(
                  activeColor: Colors.amber[900],
                  title: const Text('Pacients List',
                      style: TextStyle(fontSize: 25)),
                  subtitle: const Text(
                      "User will be able to see his patients and their details.\n"
                      "FREE",
                      style: TextStyle(fontSize: 15)),
                  value: true,
                  onChanged: null),
              SwitchListTile(
                  activeColor: Colors.amber,
                  title: const Text('Add prescription',
                      style: TextStyle(fontSize: 25)),
                  subtitle: const Text(
                      "User will be able to add the prescription and the diagnostic given to his patient.\n"
                          + "20€",
                      style: TextStyle(fontSize: 15)),
                  value: _valueAddPrescription,
                  onChanged: (bool value) {
                    setState(() {
                      _valueAddPrescription = value;

                    });
                  }),
            ],
          ),
        ),



        //
        // Expanded(
        //   child: Align(
        //     alignment: FractionalOffset.bottomRight,
        //     child: Image.asset('assets/Component4.png'),
        //   ),
        // ),

                Container(
                  width: width,
                  alignment: Alignment.bottomRight,
                  child: Stack(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Image.asset('assets/Component4.png'),
                    ]),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                  child: Text(
                                      "Click to generate\n application",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      )),
                                  onTap: () {
                                    Navigator.push<Widget>(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddHospitalLogoScreen(),
                                      ),
                                    );}
                              ),
                              SizedBox(
                                width: 50,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
                ),



      ]),
    );
  }
}
