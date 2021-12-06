import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clinido/models/doctor.dart';
import 'package:clinido/screens/specialities_screen.dart';
import 'package:clinido/widgets/doctor_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<Doctor> doctors = [
    Doctor(
      firstName: 'KShfrshjiadw',
    ),
    Doctor(
      firstName: 'KShfrshjiadw',
    ),
  ];

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
                Container(
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
                          doctos: doctors,
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
          // Expanded(
          //   child: Center(
          //     child: CarouselSlider(
          //       options: CarouselOptions(
          //         height: 300,
          //         autoPlay: true,
          //         autoPlayInterval: Duration(seconds: 3),
          //       ),
          //       items: [1, 2, 3, 4, 5].map((i) {
          //         return Builder(
          //           builder: (BuildContext context) {
          //             return Container(
          //                 width: MediaQuery.of(context).size.width,
          //                 margin: EdgeInsets.symmetric(horizontal: 5.0),
          //                 decoration: BoxDecoration(
          //                     color: Colors.lightBlueAccent,
          //                     borderRadius: BorderRadius.circular(10)),
          //                 child: Text(
          //                   'text $i',
          //                   style: TextStyle(fontSize: 16.0),
          //                 ));
          //           },
          //         );
          //       }).toList(),
          //     ),
          //   ),
          // )

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
