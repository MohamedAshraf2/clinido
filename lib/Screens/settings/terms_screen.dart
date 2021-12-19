import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Terms & Conditions')),
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
                      'Welcome! This website, www.clinido.com (the "Site," including all subdomains), is a copyrighted work belonging to CliniDo (" we," "us," and "our"). These terms of service (the "Terms") govern your access to and use of the services available on this Site (the " Services"). Specific features of the Site may have additional rules and terms associated with them, and such additional rules and terms will be prominently posted or otherwise made available to each user ("you" and "your," including any entity you represent) and are incorporated herein by reference. PLEASE READ THESE TERMS CAREFULLY. THESE TERMS CONSTITUTE A BINDING LEGAL AGREEMENT BETWEEN YOU AND US. BY USING THIS SITE AND THE RELATED SERVICES YOU UNCONDITIONALLY AGREE TO BE BOUND BY THESE TERMS, INCLUDING ALL EXCLUSIONS AND LIMITATIONS OF LIABILITY HEREIN, AND WARRANT THAT YOU HAVE FULL AUTHORITY AND CAPACITY, LEGAL AND OTHERWISE, TO USE THE SERVICES. YOU MAY NOT ACCESS OR USE THIS SITE OR THE SERVICES IF YOU DO NOT AGREE TO ANY PART OF THESE TERMS.You must be at least [18 (eighteen)] years of age to use this Site. By using this Site, you represent that you are at least [18 (eighteen)] years of age.Conditions of Use We will provide the services to you, which are subject to the conditions stated below in this document. Every time you visit this website, use its services or make a purchase, you accept the following conditions. This is why we urge you to read them carefully.This Site primarily operates as a(n) e-commerce website. CliniDo is a MedTech company with innovative technological solutions for the healthcare sector in Egypt and the MENA region. Our main profession is tackling the real pain facing the patients in finding and booking appropriate healthcare providers (Doctor, Hospital, Scan center, or Diagnostic lab) in addition to the problem of managing, archiving and sharing their medical records with different Healthcare providers on CliniDo platform. Also, were helping the healthcare providers in digitizing their practice and improving their service level through using CliniDo SAAS and EMR.By using this Site, you agree to use the Services in compliance with these Terms and all applicable rules and regulations, including the local, state, national, and international laws that apply to your jurisdiction. In particular, any imperative legal provision(s) or law(s) applicable in Egypt in relation to the Site or the provision of the Services. It may be illegal for certain persons to use the Site in some countries. We make no claim that the Site will be legal or accessible outside of Egypt. Subject to these Terms, you may view, print, and use our content and Services as permitted on the Site and only for your own personal, non-commercial use. You further agree and acknowledge that your use of this Site and the Services results in you sending electronic interstate transmissions through our computer network, and such transmissions may include, but are not limited to, any searches, file uploads, posts, instant messages, or emails.The following uses of the Site are prohibited unless we have intended to provide you with access or have provided you express written permission to the contrary: a. Using the Site in a manner that causes, or may cause, damage to the Site or in a way that impairs visitors abilities to access or use the Site and Services, including using the Site in a manner or for a purpose that is unlawful or fraudulent; b. Using the Site in order to copy, store, upload, publish, use, transmit, host, or distribute anything consisting of or linked to any computer virus, spyware, rootkit, worm, keystroke logger, or other malicious computer software or software that may destroy, damage, or alter a computer system; c. Conducting any systematic or automated data collection on or related to the Site or its users without their consent, including, without limitation, data mining, data extraction, scraping, data harvesting, "framing," or article "spinning"; d. Using the Site to collect, harvest, or compile information or data regarding other users of the Site without their consene. Using software or automated agents or scripts to generate automated searches, requests, or queries on the Site or to mine data from the Site, provided, however, that operators of public search engines have our revocable permission to copy materials from the Site for the sole purpose of and only to the extent necessary for creating public search indices, but not caches or archives of such materials, according to the parameters in our robots.txt file; f. Transmitting or sending unsolicited communications, commercial or otherwise, or conducting any marketing activities, including using the Site to send spam, pyramid schemes, or chain letters; g. Republishing (including on another website), duplicating, copying, redistributing, selling, leasing, transferring, hosting, renting, or licensing any part of the Site or otherwise commercially exploiting content, whether in whole or in part, on the Site; h. Editing, modifying, making derivative works of, reverse engineering, or reverse compiling any information, content, systems, or Services on the Site;',
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
