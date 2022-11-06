import 'package:flutter/material.dart';

import 'Appointment.dart';
class HistoryCard extends StatelessWidget {

  final double width;
  final double height;
  final Appointment appointment;


  HistoryCard({required this.width, required this.height, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 0.1 * height,
        width: width * 0.8,
        decoration: BoxDecoration(
            color: Color(0xFF3F826D).withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                Text(appointment.fullName, style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(appointment.date, style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                      SizedBox(width: 5),
                      Text(appointment.hour, style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 0.02 * height)
              ],
            ),
            TextButton(onPressed: () {}, child: Text("more..", style: TextStyle(
              fontStyle: FontStyle.italic,
                fontSize: 10,
                color: Colors.black,
                fontWeight: FontWeight.bold),))
          ],
        ),
      ),
    );
  }
}
