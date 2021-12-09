import 'package:flutter/material.dart';
import 'package:clinido/models/doctor.dart';
import 'package:clinido/widgets/doctor_card.dart';

class DoctorsList extends StatelessWidget {
  // final List<Doctor> doctors;
  final List<Map<String, dynamic>> doctors;
  const DoctorsList({Key key, @required this.doctors}) : super(key: key);

  Widget doctorBuilder(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DoctorCard(
        doctor: doctors[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      child: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (BuildContext context, int index) =>
            doctorBuilder(context, index),
      ),
    );
  }
}
