import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:clinido/widgets/my_booking_tile.dart';

class MyBookingsList extends StatefulWidget {
  final List<dynamic> bookings;

  const MyBookingsList({Key key, @required this.bookings}) : super(key: key);

  @override
  _MyBookingsListState createState() => _MyBookingsListState();
}

class _MyBookingsListState extends State<MyBookingsList> {
  Widget buildBooking(int index) {
    return Container(
        margin: EdgeInsets.all(10),
        child: MyBookingTile(booking: widget.bookings[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      child: ListView.builder(
        itemCount: widget.bookings.length,
        itemBuilder: (context, index) => buildBooking(index),
      ),
    );
  }
}
