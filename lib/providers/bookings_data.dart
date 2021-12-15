import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:clinido/models/booking.dart';

class BookingsData extends ChangeNotifier {
  List<Booking> _bookings = [];

  UnmodifiableListView get bookings {
    return UnmodifiableListView(_bookings);
  }

  void addBooking(dynamic json) {
    _bookings.add(Booking.fromJson(json));
    notifyListeners();
  }

  void addBookings(List<Booking> bookings) {
    _bookings.addAll(bookings);
    notifyListeners();
  }
}
