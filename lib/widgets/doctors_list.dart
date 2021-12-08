import 'package:flutter/material.dart';
import 'package:clinido/models/doctor.dart';
import 'package:clinido/widgets/doctor_card.dart';

class DoctorsList extends StatelessWidget {
  // final List<Doctor> doctors;
  final List<Map<String, dynamic>> doctors;
  const DoctorsList({Key key, @required this.doctors}) : super(key: key);

  Widget doctorBuilder(BuildContext context, int index) {
    return DoctorCard(
      doctor: doctors[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (BuildContext context, int index) =>
          doctorBuilder(context, index),
    );
  }
}
