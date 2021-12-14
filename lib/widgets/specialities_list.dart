import 'package:flutter/material.dart';
import 'package:clinido/models/speciality.dart';
import 'package:clinido/models/doctor.dart';
import 'package:clinido/screens/speciality_doctors_screen.dart';
import 'package:clinido/widgets/speciality_tile.dart';

class SpecialitiesList extends StatefulWidget {
  List<Speciality> specialities;
  final List<Doctor> doctors;
  SpecialitiesList(
      {Key key, @required this.specialities, @required this.doctors})
      : super(key: key);

  @override
  _SpecialitiesListState createState() => _SpecialitiesListState();
}

class _SpecialitiesListState extends State<SpecialitiesList> {
  Widget itemBuilder(BuildContext context, int index) {
    return SpecialityTile(
      specialityIcon: widget.specialities[index].icon,
      specialityTitle: widget.specialities[index].title,
      tapCallback: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => SpecialityDoctorsScreen(
              screenTitle: widget.specialities[index].title,
              doctors: widget.doctors,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.specialities.length,
      itemBuilder: (BuildContext context, int index) =>
          itemBuilder(context, index),
    );
  }
}
