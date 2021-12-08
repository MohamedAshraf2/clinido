import 'package:clinido/models/area.dart';
import 'package:clinido/models/city.dart';
import 'package:clinido/models/speciality.dart';
import 'package:flutter/material.dart';

class Doctor {
  String drArea;
  String drCategory;
  String drCity;
  String firstName;
  String id;
  String lastName;
  String mobile;

  Doctor({
    this.drArea,
    this.drCategory,
    this.drCity,
    this.firstName,
    this.id,
    this.lastName,
    this.mobile,
  });

  Doctor.fromJson(Map<String, dynamic> json, String drId) {
    drArea = json['drArea'];
    drCategory = json['drCategory'];
    drCity = json['drCity'];
    firstName = json['firstName'];
    id = drId;
    lastName = json['lastName'];
    mobile = json['mobile'];
  }

  Map<String, String> toJson() {
    return {
      'id': id,
      'lastName': lastName,
      'firstName': firstName,
      'drArea': drArea,
      'drCategory': drCategory,
      'drCity': drCity,
      'mobile': mobile
    };
  }
}

/* class Doctor {
  String id;
  String firstName;
  String lastName;
  String mobile;
  // final Image image;
  AssetImage image;
  Speciality speciality;
  City city;

  Doctor({
    this.id,
    this.firstName,
    this.lastName,
    this.mobile,
    this.image,
    this.speciality,
    this.city,
  });

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    speciality = json['speciality'] != null ? Speciality.fromJson(json['speciality']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }
} */
