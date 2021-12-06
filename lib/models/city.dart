import 'package:clinido/models/area.dart';

class City {
  final String id;
  final String name;
  final List<Area> areas;

  City({this.name, this.id, this.areas});
}
