import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:clinido/screens/authontication/authentication.dart';
// import 'screens/authontication/login.dart';
import 'package:clinido/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
    /* final _init = Firebase.initializeApp();
    return FutureBuilder(
        future: _init,
        builder: (context, snapshoot) {
          if (snapshoot.hasError) {
            return ErrorWidget();
          } else if (snapshoot.hasData) {
            return MaterialApp(
              theme: ThemeData(primarySwatch: Colors.lightBlue),
              home: Authentication(),
            );
          } else {
            return Loading();
          }
        }); */
  }
}

class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Icon(Icons.error), Text("something went wrong !")],
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
