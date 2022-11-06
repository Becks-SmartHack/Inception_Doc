import 'package:flutter/material.dart';
import 'package:structured_flutter_backend/screens/PaymentCheckoutScreen.dart';


class AddHospitalLogoScreen extends StatefulWidget {
  const AddHospitalLogoScreen({Key? key}) : super(key: key);

  @override
  State<AddHospitalLogoScreen> createState() => _AddHospitalLogoScreenState();
}

class _AddHospitalLogoScreenState extends State<AddHospitalLogoScreen> {
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
            child: Text("Add your hospital's logo",
                style: TextStyle(fontSize: 30)),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
                "   In order to create a more personalized application for your hospital,"
                " we recommend adding a picture of your hospital's logo. Otherwise, we will use our own logo.",
                style: TextStyle(fontSize: 20)),
          ),
          Center(
            child: IconButton(
              icon: Icon(Icons.perm_media_outlined, color: Colors.amber[900]),
              iconSize: 150.0,
              onPressed: null,
            ),
          ),



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
                              "Continue to payment\n checkout",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                          )),
                            onTap: () {
                              Navigator.push<Widget>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentCheckoutScreen(),
                                ),
                              );}
                        ),
                          SizedBox(
                            width:10,
                          )
                      ],
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    )

    );
  }
}
