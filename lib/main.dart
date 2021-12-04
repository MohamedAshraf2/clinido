import 'package:clinido/Screens/Authontication/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/Authontication/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _init = Firebase.initializeApp();
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
        });
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
