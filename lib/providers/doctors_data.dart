import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:clinido/models/doctor.dart';

class DoctorsData extends ChangeNotifier {
  List<Doctor> _doctors = [];
  List<Doctor> _specialityDoctors = [];

  UnmodifiableListView get doctors {
    return UnmodifiableListView(_doctors);
  }

  UnmodifiableListView get specialityDoctors {
    return UnmodifiableListView(_specialityDoctors);
  }

  void addDoctor(dynamic json) {
    _doctors.add(Doctor.fromJson(json));
    notifyListeners();
  }

  void addDoctors(List<Doctor> doctors) {
    _doctors.addAll(doctors);
    notifyListeners();
  }

  void initSpecialityDoctors(String speciality) {
    _specialityDoctors.clear();
    _doctors.forEach((doctor) {
      if (doctor.drCategory == speciality) {
        _specialityDoctors.add(doctor);
      }
    });
    notifyListeners();
  }
}
