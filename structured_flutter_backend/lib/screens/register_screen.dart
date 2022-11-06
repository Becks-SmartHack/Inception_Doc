

import 'package:flutter/material.dart';
import 'package:structured_flutter_backend/screens/carousel_screen.dart';
import 'package:structured_flutter_backend/screens/login_page.dart';
import 'package:structured_flutter_backend/services/login_service.dart';
import 'package:structured_flutter_backend/services/registration_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController hospitalController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/Component3.png',
                )
              ],
            ),
            Text(
              'Sign up',
              selectionColor: Color.fromRGBO(28, 35, 33, 1),
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600
              ),
            ),


            Padding(
              padding: EdgeInsets.fromLTRB(37, 0, 37, 0),
              child: TextFormField(
                controller: hospitalController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.local_hospital_rounded),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color.fromRGBO(48, 131, 220, 0.2),)
                  ),
                  hintText: 'Hospital',
                  fillColor: Color.fromRGBO(48, 131, 220, 0.2),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(37, 0, 37, 0),
              child: TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color.fromRGBO(48, 131, 220, 0.2),)
                  ),
                  hintText: 'First name',
                  fillColor: Color.fromRGBO(48, 131, 220, 0.2),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(37, 0, 37, 0),
              child: TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color.fromRGBO(48, 131, 220, 0.2),)
                  ),
                  hintText: 'Last name',
                  fillColor: Color.fromRGBO(48, 131, 220, 0.2),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(37, 0, 37, 0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outlined),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color.fromRGBO(48, 131, 220, 0.2),)
                  ),
                  hintText: 'E-mail',
                  fillColor: Color.fromRGBO(48, 131, 220, 0.2),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(37, 0, 37, 0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color.fromRGBO(48, 131, 220, 0.2),)
                  ),
                  hintText: 'Password',
                  fillColor: Color.fromRGBO(48, 131, 220, 0.2),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(37, 0, 37, 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color.fromRGBO(48, 131, 220, 0.2),)
                  ),
                  hintText: 'Confirm password',
                  fillColor: Color.fromRGBO(48, 131, 220, 0.2),
                ),
              ),
            ),
       // ElevatedButton(onPressed: null,
       //   child: Text("Register"),
       //     style: ButtonStyle(
       //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
       //             RoundedRectangleBorder(
       //                 borderRadius: BorderRadius.circular(18.0),
       //                 side: BorderSide(color: Colors.red)
       //             )
       //         )
       //     )),


            ElevatedButton(
                child: Text(
                    "Sign up".toUpperCase(),
                    style: TextStyle(fontSize: 14)
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.red)
                        )
                    )
                ),
                onPressed: () =>
                  setState(() async {
                   var user = RegistrationUser(hospitalController.text, firstNameController.text, lastNameController.text,
                   emailController.text, passwordController.text, UserType.AppManager);
                   await user.registerUser();
                   var userLog = LoginUser(emailController.text, passwordController.text);
                   await userLog.loginUser();

                   Navigator.push<Widget>(
                     context,
                     MaterialPageRoute(
                       builder: (context) => CarouselScreen(),
                     ),
                   );

                }),

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/Component4.png',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
