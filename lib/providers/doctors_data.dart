import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:clinido/models/doctor.dart';

class DoctorsData extends ChangeNotifier {
  List<Doctor> _doctors = [];

  UnmodifiableListView get doctors {
    return UnmodifiableListView(_doctors);
  }

  void addDoctor(dynamic json) {
    _doctors.add(Doctor.fromJson(json));
    notifyListeners();
  }

  void addDoctors(List<Doctor> doctors) {
    _doctors.addAll(doctors);
    notifyListeners();
  }
}
