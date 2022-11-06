import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:structured_flutter_backend/screens/register_screen.dart';
import 'package:structured_flutter_backend/screens/splash.dart';
import 'package:structured_flutter_backend/screens/carousel_screen.dart';
import 'package:structured_flutter_backend/services/login_service.dart';

class LoginPage extends StatefulWidget{
  const LoginPage ({Key? key, required this.title}) : super (key: key);
  final String title;

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage  extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

    void navigateCarouselScreen () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => CarouselScreen ()
          )
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              'Let’s get you in',
              selectionColor: Color.fromRGBO(28, 35, 33, 1),
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w600
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(100 * width / 1080 , 0, 100 * width / 1080, 0),
                child: Column(
                children:[
                  TextFormField(
                    controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color.fromRGBO(48, 131, 220, 0.2),)
                    ),
                    hintText: 'Email',
                    fillColor: Color.fromRGBO(48, 131, 220, 0.2),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                  SizedBox(height: 40),

                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(

                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color.fromRGBO(48, 131, 220, 0.2),)
                      ),
                      hintText: 'Password',
                      fillColor: Color.fromRGBO(48, 131, 220, 0.2),
                      prefixIcon: Icon(Icons.key),

                    ),
                  ),
              ],
              ),
            ),

              ElevatedButton(
                onPressed: () async {
                  var Response = LoginUser(emailController.text, passwordController.text);
                  var response;
                  await Response.loginUser().then((value) => response = value);
                  print(response);
                  if (response == LoginResponse.LoignSuccessful){
                    navigateCarouselScreen();
                  }
                  else if (response == LoginResponse.LoginError){
                    showDialog(context: context,
                        builder: (context){
                      return AlertDialog(
                        title: Text(
                        "Wrong credentials!",
                        style: TextStyle(fontSize: 24.0),
                      ),
                      );
                        });
                  }

                },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {

              return Color.fromRGBO(240,101,67, 1);
              },
              ),

                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Color.fromRGBO(240,101,67, 1))
                          ),
                      ),
                  ),
                  child: Text("Log in")
                ),
            SizedBox(width: 10, height: 10),
            Text("Don't have an account?"),
            GestureDetector(
                onTap: () {
                  Navigator.push<Widget>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  );
                },
                child: Text( 'Sign in',
                style: TextStyle(color: Colors.amber[900])
                )
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/Component4.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}