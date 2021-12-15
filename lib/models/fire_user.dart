import 'package:clinido/models/booking.dart';

class FireUser {
  String displayName;
  String email;
  List<Booking> bookings;

  FireUser({this.displayName, this.email, this.bookings});

  FireUser.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    email = json['email'];
    if (json['bookings'] != null) {
      bookings = [];
      json['bookings'].forEach((v) {
        bookings.add(new Booking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    if (this.bookings != null) {
      data['bookings'] = this.bookings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
