import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clinido/widgets/my_bookings_list.dart';

class MyBookingsTabTab extends StatefulWidget {
  const MyBookingsTabTab({Key key}) : super(key: key);

  @override
  MmBbookingTtaTtabState createState() => MmBbookingTtaTtabState();
}

class MmBbookingTtaTtabState extends State<MyBookingsTabTab> {
  List<dynamic> bookings = [];

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((doc) {
      setState(() {
        bookings.addAll(doc.data()['bookings']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(
        'User ID: ${FirebaseAuth.instance.currentUser.uid} From My Bookings Tab Tab');
    return MyBookingsList(bookings: bookings);
  }
}
