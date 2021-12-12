import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clinido/models/doctor.dart';
import 'package:clinido/models/city.dart';
import 'package:clinido/models/area.dart';
import 'package:clinido/models/speciality.dart';
import 'package:clinido/screens/specialities_screen.dart';
import 'package:clinido/widgets/doctor_card.dart';

import '../confirm_reservation_screen.dart';

import 'package:url_launcher/url_launcher.dart';

class HomeTab extends StatefulWidget {
  final Map<String, dynamic> doctor;
  const HomeTab({this.doctor});

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final store = FirebaseFirestore.instance;
  // final List<Doctor> doctorsss = [];
  final List<Map<String, dynamic>> doctorsss = [];

  getDocrorsdata() async {
    final _docrorss = await store.collection("Doctor").get();
    for (var doctor in _docrorss.docs) {
      Map<String, dynamic> tempDoctor = doctor.data();
      tempDoctor.addAll({'id': doctor.id});
      // doctorsss.add(Doctor.fromJson(doctor.data(), doctor.id));
      doctorsss.add(tempDoctor);
    }
  }

  final _url = 'tel://+20 1014082517';

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  void initState() {
    super.initState();
    getDocrorsdata();
  }

  @override
  Widget build(BuildContext context) {
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
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => SpecialitiesScreen(
                          doctos: doctorsss,
                        )));
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
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
              ),
              items: doctorsss.map((doctor) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        child: DoctorCard(
                      doctor: doctor,
                    )
                        // Card(
                        //   child: Container(
                        //     child: Column(
                        //       children: [
                        //         Row(
                        //           children: [
                        //             Container(
                        //               margin: EdgeInsets.all(10),
                        //               width: 45,
                        //               height: 45,
                        //               child: CircleAvatar(
                        //                 backgroundImage: AssetImage(
                        //                     'assets/images/GSCT8252.jpg'),
                        //                 // backgroundImage: widget.doctor.image,
                        //               ),
                        //             ),
                        //             Container(
                        //               child: Column(
                        //                 children: [
                        //                   Container(
                        //                     margin: EdgeInsets.only(right: 20),
                        //                     child: Text(
                        //                       // "Dr. Mohammed Ashraf",
                        //                       // "${widget.doctor.firstName} ${widget.doctor.lastName}",
                        //                       "${doctor['firstName']} ${doctor['lastName']}",
                        //                       style: TextStyle(
                        //                           color: Colors.lightBlueAccent,
                        //                           fontWeight: FontWeight.bold,
                        //                           fontSize: 18),
                        //                     ),
                        //                   ),
                        //                   Container(
                        //                     margin: EdgeInsets.only(
                        //                         left: 10, top: 10),
                        //                     width: 200,
                        //                     child: Text(
                        //                       // "Consaltent of Allgery and immunology",
                        //                       // widget.doctor.speciality.title,
                        //                       doctor['drCategory'],
                        //                       style: TextStyle(
                        //                           // color: Colors.lightBlueAccent,
                        //                           fontWeight: FontWeight.bold,
                        //                           fontSize: 13),
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //             )
                        //           ],
                        //         ),
                        //         Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Container(
                        //               margin: EdgeInsets.only(left: 15),
                        //               child: Text(
                        //                 "First in First Out",
                        //                 style: TextStyle(
                        //                     fontSize: 12,
                        //                     fontWeight: FontWeight.bold,
                        //                     color: Colors.grey[600]),
                        //               ),
                        //             ),
                        //             Container(
                        //               margin: EdgeInsets.only(right: 15),
                        //               child: Row(
                        //                 children: [
                        //                   Icon(
                        //                     Icons.star,
                        //                     color: Colors.yellow,
                        //                   ),
                        //                   SizedBox(
                        //                     width: 5,
                        //                   ),
                        //                   Text('5.0'),
                        //                   SizedBox(
                        //                     width: 20,
                        //                   ),
                        //                   Icon(
                        //                     Icons.remove_red_eye,
                        //                     color: Colors.grey[600],
                        //                   ),
                        //                   SizedBox(
                        //                     width: 5,
                        //                   ),
                        //                   Text('19987')
                        //                 ],
                        //               ),
                        //             )
                        //           ],
                        //         ),
                        //         Container(
                        //           margin: EdgeInsets.symmetric(vertical: 10),
                        //           padding: EdgeInsets.only(left: 30, top: 15),
                        //           height: 40,
                        //           width: double.infinity,
                        //           color: Colors.grey[200],
                        //           child: Text(
                        //             // 'Heliopless , 12 st boutstrab ghlya 4floor Roxy',
                        //             // '${widget.doctor.city.name}, ${widget.doctor.city.areas[0].name}',
                        //             '${doctor['drCity']}, ${doctor['drArea']}',
                        //           ),
                        //         ),
                        //         Container(
                        //           padding: EdgeInsets.symmetric(vertical: 15),
                        //           child: Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceAround,
                        //             children: [
                        //               Row(
                        //                 children: [
                        //                   Icon(
                        //                     Icons.access_alarm,
                        //                     size: 50,
                        //                     color: Colors.lightBlueAccent,
                        //                   ),
                        //                   SizedBox(
                        //                     width: 10,
                        //                   ),
                        //                   Column(
                        //                     children: [
                        //                       Text(
                        //                         'Waiting Time',
                        //                         style: TextStyle(
                        //                             fontSize: 15,
                        //                             fontWeight: FontWeight.bold),
                        //                       ),
                        //                       Text('15 Minutes'),
                        //                     ],
                        //                   ),
                        //                 ],
                        //               ),
                        //               Row(
                        //                 children: [
                        //                   Icon(
                        //                     Icons.attach_money,
                        //                     size: 50,
                        //                     color: Colors.lightBlueAccent,
                        //                   ),
                        //                   SizedBox(
                        //                     width: 10,
                        //                   ),
                        //                   Column(
                        //                     children: [
                        //                       Text(
                        //                         'Fees',
                        //                         style: TextStyle(
                        //                             fontSize: 15,
                        //                             fontWeight: FontWeight.bold),
                        //                       ),
                        //                       Text('400 EGP'),
                        //                     ],
                        //                   )
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         Container(
                        //           margin: EdgeInsets.all(20),
                        //           width: double.infinity,
                        //           height: 50,
                        //           child: ElevatedButton(
                        //             style: ElevatedButton.styleFrom(
                        //                 primary: Color(0xff2fc34b)),
                        //             onPressed: () => {
                        //               Navigator.of(context).push(
                        //                   MaterialPageRoute(
                        //                       builder: (_) => ConfirmScreen(
                        //                           doctor: widget.doctor)))
                        //             },
                        //             child: Text(
                        //               "Book Tomorrow (03:00 PM -06:00PM)",
                        //               style: TextStyle(
                        //                   color: Colors.white, fontSize: 15),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        );
                  },
                );
              }).toList(),
            ),
          )

          /* Container(
            width: 350,
            margin: EdgeInsets.only(top: 30),
            child: DoctorCard(),
          ), */
        ],
      ),
    );
  }
}
