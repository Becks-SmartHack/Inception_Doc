import 'package:flutter/material.dart';
import 'package:structured_flutter_backend/Patient.dart';

class PatientCell extends StatelessWidget {
  const PatientCell(
      {required this.width, required this.height, required this.patient});

  final double width;
  final double height;
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: Container(
          // color: Colors.blue,
          height: 0.2 * height,
          width: width * 0.8,
          decoration: BoxDecoration(
              color: Color(0xFF3F826D).withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("09:45AM", style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                    SizedBox(width: width * 0.05)
                  ],
                ),
              ),
              Text("Nume Complet", style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
              Text("More details", style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.w400)),
              SizedBox(height: 0.02 * height)
            ],
          ),
        ),
      ),
      onTap: () => {},
    );
  }
}
