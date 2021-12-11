import 'package:flutter/material.dart';
import 'authontication/login_screen.dart';
import 'authontication/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clinido/widgets/rounded_btn.dart';
import 'package:clinido/navigation/extract_arguments_screen .dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 100,
              child: DefaultTextStyle(
                child: SizedBox(
                  width: 250.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agne',
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Discipline is the best tool'),
                        TypewriterAnimatedText('Design first, then code'),
                        TypewriterAnimatedText(
                            'Do not patch bugs out, rewrite them'),
                        TypewriterAnimatedText(
                            'Do not test bugs out, design them out'),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/images/logo.png'),
                    height: 60.0,
                    width: 130,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: "Login",
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              colour: Colors.lightBlue,
              title: "Register",
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
