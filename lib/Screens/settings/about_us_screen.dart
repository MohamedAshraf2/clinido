import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Abbout Us')),
      body: Container(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 100, bottom: 50),
            child: Image.asset('assets/images/1.jpeg'),
          ),
        ]),
      ),
    );
  }
}
