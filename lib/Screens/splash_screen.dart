import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:clinido/Screens/home_screen.dart';
import 'package:clinido/Screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = "splash_screen";
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () => initAuthState());
    super.initState();
  }

  void initAuthState() {
    if (FirebaseAuth.instance.currentUser != null) {
      Future.delayed(
          const Duration(milliseconds: 1500),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomeScreen())));
    } else {
      Future.delayed(
          const Duration(milliseconds: 1500),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => WelcomeScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/logo.png'),
            ),
            SizedBox(
              height: 100,
            ),
            SpinKitSpinningLines(
              color: Colors.lightBlueAccent,
              lineWidth: 5,
              size: 120,
            )
          ],
        ),
      ),
    );
  }
}
