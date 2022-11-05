import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//code for designing the UI of our text field where the user writes his email id or password

enum RegistrationResponse{
  RegistrationSuccessful,
  WeakPassword,
  EmailAlreadyInUse,
  OtherError
}

enum UserType{
  AppManager,
  Doctor,
  Patient
}

class RegistrationUser {
  //appManager
  late String _hospitalName;
  late String _firstName;
  late String _lastName;
  late String _username;
  late UserType _user;
  late String _idDataBase;

  // doctors
  late String _fullName;
  late String _specialization;

  // common
  late String _email;
  late String _password;

  RegistrationUser(this._hospitalName, this._firstName, this._lastName, this._email, this._password, this._user);
  RegistrationUser.FromRegistrationUser(this._fullName, this._idDataBase, this._specialization, this._email, this._password, this._user);

  Future<RegistrationResponse> registerUser() async {
    try{
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);

      switch(_user) {
        case UserType.AppManager:
          var db = FirebaseFirestore.instance;
          var newUser = <String, dynamic> {
            "hospitalName": _hospitalName,
            "firstName": _firstName,
            "lastName": _lastName,
            'email': _email,
            "password": _password
          };
          db.collection('hospitals').add(newUser).then((DocumentReference doc) => _idDataBase = doc.id);
          break;
        case UserType.Doctor:
          var db = FirebaseFirestore.instance;
          var newUser = <String, dynamic>{
            'fullName': _fullName,
            'specialization': _specialization,
            'email': _email,
            'password': _password,
          };
          db.collection('hospitals').doc(_idDataBase).collection('doctors').add(newUser).then((value) => null);
          break;
      }

      //   final user = <String, dynamic>{
//     "first": "Ada",
//     "last": "Lovelace",
//     "born": 1815
//   };
//
// // Add a new document with a generated ID
//   db.collection("hospital1").add(user).then((DocumentReference doc) =>
//       print('DocumentSnapshot added with ID: ${doc.id}'));

      return RegistrationResponse.RegistrationSuccessful;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return RegistrationResponse.WeakPassword;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return RegistrationResponse.EmailAlreadyInUse;
      }
    } catch (e) {
      print(e);
      return RegistrationResponse.OtherError;
    }

    return RegistrationResponse.OtherError;
  }
}

// class RegistrationScreen extends StatefulWidget {
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final _auth = FirebaseAuth.instance;
//   late String email;
//   late String password;
//   bool showSpinner = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ModalProgressHUD(
//         inAsyncCall: showSpinner,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     email = value;
//                     //Do something with the user input.
//                   },
//                   decoration: kTextFieldDecoration.copyWith(
//                       hintText: 'Enter your email')),
//               SizedBox(
//                 height: 8.0,
//               ),
//               TextField(
//                   obscureText: true,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     password = value;
//                     //Do something with the user input.
//                   },
//                   decoration: kTextFieldDecoration.copyWith(
//                       hintText: 'Enter your Password')),
//               SizedBox(
//                 height: 24.0,
//               ),
//               // RoundedButton(
//               //   colour: Colors.blueAccent,
//               //   title: 'Register',
//               //   onPressed: () async {
//               //     setState(() {
//               //       showSpinner = true;
//               //     });
//               //     try {
//               //       final newUser = await _auth.createUserWithEmailAndPassword(
//               //           email: email, password: password);
//               //       if (newUser != null) {
//               //         Navigator.pushNamed(context, 'home_screen');
//               //       }
//               //     } catch (e) {
//               //       print(e);
//               //     }
//               //     setState(() {
//               //       showSpinner = false;
//               //     });
//               //   },
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }