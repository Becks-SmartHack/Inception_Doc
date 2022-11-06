import 'package:flutter/material.dart';
import 'package:structured_flutter_backend/AppointmentCard.dart';
import 'package:structured_flutter_backend/HistoryCard.dart';

import 'Appointment.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Appointment> appointments = [
    new Appointment(
        "Ana ana", "General consultation", "06/11/2022", "10:00 AM"),
    new Appointment("Ana Maria", "Flu consult", "06/11/2022", "11:00 AM"),
    new Appointment(
        "Ana Blandiana", "After Treatment consult", "06/11/2022", "12:00 AM"),
    new Appointment(
        "Ana Elena", "General consultation", "06/11/2022", "13:00 AM"),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<AppointmentCard> appointmentsCards = [];

    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Container(
            height: 0.08 * height,
            child: Stack(children: [
              Image.asset('assets/sfera.png'),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Icon(Icons.menu, color: Colors.white),
                )
              ])
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            height: 0.15 * height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 0.08 * width),
                    Text("Patients History",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 0.08 * width),
                    Text("List",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 0.69 * height,
            child: Center(
                child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return new HistoryCard(
                    width: width,
                    height: height,
                    appointment: appointments[index]);
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 15,
              ),
              itemCount: appointments.length,
            )),
          )
        ],
      ),
    ));
  }
}
