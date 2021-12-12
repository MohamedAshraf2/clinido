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
      ),
    );
  }
}

// Root View Column
// Text
// Tab Bar View 
// My Bokkings Tab
// My Consultations Tab
