

import 'package:flutter/material.dart';
import 'package:structured_flutter_backend/screens/LoadingScreen.dart';

class PaymentCheckoutScreen extends StatefulWidget {
  const PaymentCheckoutScreen({Key? key}) : super(key: key);

  @override
  State<PaymentCheckoutScreen> createState() => _PaymentCheckoutScreenState();
}

class _PaymentCheckoutScreenState extends State<PaymentCheckoutScreen> {
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
                child: Text("Payment checkout",
                    style: TextStyle(fontSize: 30)),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text(
                    "   In order to create a more personalized application for your hospital,"
                        " we recommend adding a picture of your hospital's logo. Otherwise, we will use our own logo.",
                    style: TextStyle(fontSize: 20)),
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
                                    "Continue to payment",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                    )),
                                onTap: () {
                                  Navigator.push<Widget>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoadingScreen(),
                                    ),
                                  );}
                            ),
                            SizedBox(
                              width: 30,
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
