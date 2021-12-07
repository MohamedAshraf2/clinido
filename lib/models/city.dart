import 'package:clinido/models/area.dart';

class City {
  String id;
  String name;
  List<Area> areas;

  City({this.name, this.id, this.areas});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['areas'] != null) {
      areas = [];
      json['areas'].forEach((v) {
        areas.add(new Area.fromJson(v));
      });
    }
  }
}
