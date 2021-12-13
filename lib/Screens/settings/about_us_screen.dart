import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _Phone = 'tel://+20 1201111344';

    void _launchPhone() async => await canLaunch(_Phone)
        ? await launch(_Phone)
        : throw 'Could not launch $_Phone';

    String email = "info@cliniDo.com";

    _launchEmail() async {
      if (await canLaunch("mailto:$email")) {
        await launch("mailto:$email");
      } else {
        throw 'Could not launch';
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Contact Us')),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, bottom: 50),
              child: Image.asset('assets/images/logo.png'),
            ),
            Container(
              margin: EdgeInsets.only(left: 80),
              child: Row(
                children: [
                  Text(
                    'Email :',
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                      onPressed: () => {_launchEmail()},
                      child: Text(
                        'info@cliniDo.com',
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 80),
              child: Row(
                children: [
                  Text(
                    'Phone No :',
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                      onPressed: () => {_launchPhone()},
                      child: Text(
                        '+20 1201111344',
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
