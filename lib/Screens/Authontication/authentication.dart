import 'package:clinido/Screens/Authontication/login.dart';
import 'package:clinido/Screens/Authontication/signup.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isToggel = false;

  void toggelScreen() {
    setState(() {
      isToggel = !isToggel;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isToggel) {
      return Signup(toggelScreen: toggelScreen);
    } else {
      return Login(toggelScreen: toggelScreen);
    }
  }
}
