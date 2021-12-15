import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clinido/providers/user_data.dart';
import 'package:clinido/widgets/my_bookings_list.dart';

class MyBookingsTab extends StatefulWidget {
  @override
  _MyBookingsTabState createState() => _MyBookingsTabState();
}

class _MyBookingsTabState extends State<MyBookingsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyBookingsList());
  }
}

// Root View Column
// Text
// Tab Bar View 
// My Bokkings Tab
// My Consultations Tab
