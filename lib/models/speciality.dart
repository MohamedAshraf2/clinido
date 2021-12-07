import 'package:flutter/material.dart';

class Speciality {
  String title;
  Icon icon;

  Speciality({this.title, this.icon});

  Speciality.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
  }
}
