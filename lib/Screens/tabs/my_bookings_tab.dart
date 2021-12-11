import 'dart:async';
import 'dart:io';

import 'package:clinido/screens/specialities_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clinido/screens/tabs/my_bookings_tab_tab.dart';
import 'package:clinido/screens/tabs/my_consultations_tab_tab.dart';

class MyBookingsTab extends StatefulWidget {
  final Map<String, dynamic> doctor;
  const MyBookingsTab({this.doctor});

  @override
  _MyBookingsTabState createState() => _MyBookingsTabState();
}

class _MyBookingsTabState extends State<MyBookingsTab> {
  bool texCheck = true;
  bool desplayBobking = false;
  final _auth = FirebaseAuth.instance;
  String x = '';
  var _time = new Timer(Duration(seconds: 1), () => {});
  final List<Map<String, dynamic>> doctorsss = [];

  void initState() {
    super.initState();
    getCurrentUser();
    getBookingdata();
    getDocrorsdata();
  }

  getDocrorsdata() async {
    final _docrorss = await store.collection("Doctor").get();
    for (var doctor in _docrorss.docs) {
      Map<String, dynamic> tempDoctor = doctor.data();
      tempDoctor.addAll({'id': doctor.id});
      // doctorsss.add(Doctor.fromJson(doctor.data(), doctor.id));
      doctorsss.add(tempDoctor);
    }
  }

  final store = FirebaseFirestore.instance;
  // final List<Doctor> doctorsss = [];
  final List<Map<String, dynamic>> bookesss = [];
  final List<Map<String, dynamic>> booklist = [];

  getBookingdata() {
    store.collection('users').doc(_auth.currentUser.uid).get().then((doc) {
      print(doc.data()['bookings']);
    });
    /* final _bookess = await store.collection("Booking").get();
    for (var book in _bookess.docs) {
      Map<String, dynamic> tempDoctor = book.data();
      tempDoctor.addAll({'id': book.id});
      // doctorsss.add(Doctor.fromJson(doctor.data(), doctor.id));
      bookesss.add(tempDoctor);
    } */
  }

  void getCurrentUser() async {
    // _auth.currentUser.
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser.uid)
          .get()
          .then((value) {
        setState(() {
          x = value.data()['displayName'];
        });
      }).catchError((e) {
        print(e);
      });
    } catch (e) {}
  }

  void booking() {
    setState(() {
      texCheck = true;
    });
  }

  void consult() {
    setState(() {
      texCheck = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: TabBar(
            tabs: [
              Tab(
                child: Container(
                  color: Colors.amber,
                  child: Text('My Bookings'),
                ),
              ),
              Tab(
                text: 'My Consultations',
              ),
            ],
            indicatorColor: Colors.transparent,
          ),
        ),
        body: TabBarView(
          children: [
            MyBookingsTabTab(),
            MyConsultationsTabTab(),
          ],
        ),
        /* body: Container(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(30),
              child: Text(
                "My BooKings",
                style: TextStyle(
                  color: Color(0xff004f6c),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Container(
                    width: 180,
                    margin: EdgeInsets.symmetric(horizontal: 13),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                      onPressed: () => {booking(), print(booklist)},
                      child: Text("My BooKings"),
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                      onPressed: () => {consult()},
                      child: Text("My online Consultation"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: booklist.isEmpty
                  ? Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 90),
                          child: Icon(
                            Icons.calendar_today_rounded,
                            color: Colors.grey[500],
                            size: 160,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: texCheck
                              ? Text(
                                  "MY Bookings",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800]),
                                )
                              : Text(
                                  "My Consultations",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800]),
                                ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff2fc34b)),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => SpecialitiesScreen(
                                        doctos: doctorsss,
                                      )));
                            },
                            child: Text(
                              "Book Now",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Card(
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  width: 45,
                                  height: 45,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/GSCT8252.jpg'),
                                    // backgroundImage: widget.doctor.image,
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Text(
                                          // "Dr. Mohammed Ashraf",
                                          // "${widget.doctor.firstName} ${widget.doctor.lastName}",
                                          "${widget.doctor['firstName']} ${widget.doctor['lastName']}",
                                          style: TextStyle(
                                              color: Colors.lightBlueAccent,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 10, top: 10),
                                        child: Text(
                                          // "Consaltent of Allgery and immunology",
                                          // widget.doctor.speciality.title,
                                          widget.doctor['drCategory'],
                                          style: TextStyle(
                                              // color: Colors.lightBlueAccent,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.only(left: 30, top: 15),
                              height: 100,
                              width: double.infinity,
                              color: Colors.grey[200],
                              child: Column(
                                children: [
                                  Text('Location'),
                                  Text(
                                    // 'Heliopless , 12 st boutstrab ghlya 4floor Roxy',
                                    // '${widget.doctor.city.name}, ${widget.doctor.city.areas[0].name}',
                                    '${widget.doctor['drCity']}, ${widget.doctor['drArea']}',
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text('Booking info'))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xff2fc34b)),
                                onPressed: () => {},
                                child: Text(
                                  "Cancel Reservation",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        )), */
      ),
    );
  }
}

// Root View Column
// Text
// Tab Bar View 
// My Bokkings Tab
// My Consultations Tab
