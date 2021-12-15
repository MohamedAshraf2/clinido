import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clinido/models/doctor.dart';
import 'package:clinido/models/city.dart';
import 'package:clinido/models/area.dart';
import 'package:clinido/models/speciality.dart';
import 'package:provider/provider.dart';
import 'package:clinido/providers/doctors_data.dart';
import 'package:clinido/screens/specialities_screen.dart';
import 'package:clinido/widgets/doctor_card.dart';

import '../confirm_reservation_screen.dart';

import 'package:url_launcher/url_launcher.dart';

class HomeTab extends StatefulWidget {
  const HomeTab();

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final store = FirebaseFirestore.instance;
  // final List<Doctor> doctorsss = [];

  final _url = 'tel://+20 1014082517';

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorsData>(builder: (context, doctorsData, child) {
      return Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text(
                          'Need a doctor?',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text(
                          'Book online or call us to help you',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => _launchURL(),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 32),
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        elevation: 4,
                        child: CircleAvatar(
                          backgroundColor: Colors.lightBlueAccent,
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          maxRadius: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: kToolbarHeight,
              margin: EdgeInsets.only(top: 8, bottom: 12, left: 8, right: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                // color: Colors.lightGreenAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => SpecialitiesScreen()));
                },
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        Icons.search,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    Text(
                      'Book an appointment in Clinic',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Divider(
                thickness: 1.25,
                color: Colors.grey[400],
              ),
            ),
            Container(
              // height: 600,
              child: Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 370,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                  ),
                  items: doctorsData.doctors.map(
                    (doctor) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              child: DoctorCard(
                            doctor: doctor,
                          ));
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
