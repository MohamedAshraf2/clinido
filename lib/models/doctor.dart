import 'package:clinido/models/area.dart';
import 'package:clinido/models/city.dart';
import 'package:clinido/models/speciality.dart';
import 'package:flutter/material.dart';

class Doctor {
  final String id;
  final String firstName;
  final String lastName;
  final String mobile;
  // final Image image;
  final AssetImage image;
  final Speciality speciality;
  final City city;

  Doctor({
    this.id,
    this.firstName,
    this.lastName,
    this.mobile,
    this.image,
    this.speciality,
    this.city,
  });
}
