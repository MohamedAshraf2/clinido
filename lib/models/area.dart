import 'package:flutter/material.dart';

class Area {
  String id;
  String name;

  Area({@required this.name, @required this.id});

  Area.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }
}
