import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clinido/widgets/my_booking_tile.dart';
import 'package:provider/provider.dart';
import 'package:clinido/providers/user_data.dart';

class MyBookingsList extends StatefulWidget {
  const MyBookingsList({Key key}) : super(key: key);

  @override
  _MyBookingsListState createState() => _MyBookingsListState();
}

class _MyBookingsListState extends State<MyBookingsList> {
  Widget buildUserBookings(int index, UserData userData) {
    return Container(
        margin: EdgeInsets.all(10),
        child: MyBookingTile(
            booking: userData.fireUser != null
                ? userData.fireUser.bookings != null
                    ? userData.fireUser.bookings[index]
                    : []
                : []));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(builder: (context, userData, child) {
      return Container(
        color: Colors.grey[400],
        child: ListView.builder(
          itemCount: userData.fireUser != null
              ? userData.fireUser.bookings != null
                  ? userData.fireUser.bookings.length
                  : 0
              : 0,
          itemBuilder: (context, index) => buildUserBookings(index, userData),
        ),
      );
    });
  }
}
