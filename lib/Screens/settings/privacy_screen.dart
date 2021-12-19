import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Privacy & Policy')),
        body: SingleChildScrollView(
          child: Container(
              child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 50),
              child: Image.asset('assets/images/logo.png'),
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  Container(
                    width: 320,
                    child: Text(
                      'Last Updated: September 30, 2020 Introduction Welcome to CliniDo privacy policy and general terms and conditions.The Company (hereinafter defined below) respects your privacy and is committed to protecting your personal data. This privacy policy will inform you as to how we look after your personal data when you visit our website [WWW.CLINIDO.COM] or use our application (irrespectively of your location) and tell you about your privacy rights and how the law protects you.This privacy policy is provided in a layered format, so you can click through to the specific areas set out below. Alternatively, you can download a pdf version of the policy here: [WWW.CLINIDO.COM]. Please also use the Glossary to understand the meaning of some of the terms used in this privacy policy.1. Important information and who we arePurpose of this privacy policy This privacy policy aims to give you information on how the Company collects and processes your personal data through your use of this website and/or app, including any data you may provide through this website/app when you sign up thereto.This website/app is not intended for children and we do not knowingly collect data relating to children. For the purpose of this policy children means all persons whose age is less than 21 years old.It is important that you read this privacy policy together with any other privacy policy or fair processing policy we may provide on specific occasions when we are collecting or processing personal data about you so that you are fully aware of how and why we are using your data. This privacy policy supplements other privacy policies and is not intended to override them.',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ])),
        ));
  }
}
