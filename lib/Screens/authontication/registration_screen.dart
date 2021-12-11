import 'package:clinido/screens/home_screen.dart';
import 'package:clinido/widgets/rounded_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constants.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "registration_screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String displayName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  displayName = value;
                },
                decoration:
                    KTextFieldDecoration.copyWith(hintText: "Enter User Name")),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: KTextFieldDecoration.copyWith(
                    hintText: "Enter Your Email")),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: KTextFieldDecoration.copyWith(
                    hintText: "Enter Your Password")),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              colour: Colors.blueAccent,
              title: "Register",
              onPressed: () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: email, password: password)
                    .then((userCredential) {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(userCredential.user.uid)
                      .set({'displayName': displayName, 'email': email}).then(
                          (value) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  }).catchError((e) {
                    print('The Error: $e');
                  });
                }).catchError((e) {
                  print('The Error: $e');
                });
                /* try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: Email, password: Password);
                  if (newUser != null) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => HomeScreen()));
                  }
                } catch (e) {
                  print(e);
                } */
              },
            ),
          ],
        ),
      ),
    );
  }
}
