import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clinido/models/booking.dart';

import 'package:url_launcher/url_launcher.dart';

class MyBookingTile extends StatefulWidget {
  final Booking booking;

  const MyBookingTile({Key key, @required this.booking}) : super(key: key);

  @override
  _MyBookingTileState createState() => _MyBookingTileState();
}

class _MyBookingTileState extends State<MyBookingTile> {
  void cancelBooking() {}

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    backgroundImage: NetworkImage(widget.booking.image),
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
                          "${widget.booking.DoctorName}",
                          style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          // "Consaltent of Allgery and immunology",
                          // widget.doctor.speciality.title,
                          "${widget.booking.DoctorCategory}",
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
              padding: EdgeInsets.only(top: 15),
              height: 130,
              width: double.infinity,
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Reservation Time :'),
                  Container(
                    // margin: EdgeInsets.only(left: 60),
                    width: 250,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        // 'Heliopless , 12 st boutstrab ghlya 4floor Roxy',
                        // '${widget.doctor.city.name}, ${widget.doctor.city.areas[0].name}',
                        '${widget.booking.resevationTime}',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    // 'Heliopless , 12 st boutstrab ghlya 4floor Roxy',
                    // '${widget.doctor.city.name}, ${widget.doctor.city.areas[0].name}',
                    'Location ',
                  ),
                  Text(
                    // 'Heliopless , 12 st boutstrab ghlya 4floor Roxy',
                    // '${widget.doctor.city.name}, ${widget.doctor.city.areas[0].name}',
                    '${widget.booking.addr}',
                  ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(primary: Colors.green[500]),
                  //   onPressed: () {},
                  //   child: Text('Booking info'),
                  // ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        launch('tel://${widget.booking.DoctorPhone}'),
                    child: Text('Call Clinic'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red[900]),
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser.uid)
                          .update({
                        'bookings':
                            FieldValue.arrayRemove([widget.booking.toJson()])
                      });
                    },
                    child: Text(
                      "Cancel Reservation",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: Realtime Changes