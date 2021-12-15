import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clinido/providers/doctors_data.dart';
import 'package:clinido/widgets/doctor_card.dart';

class DoctorsList extends StatelessWidget {
  Widget doctorBuilder(int index, DoctorsData doctorsData) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DoctorCard(
        doctor: doctorsData.specialityDoctors[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorsData>(builder: (context, doctorsData, child) {
      return Container(
        color: Colors.grey[400],
        child: ListView.builder(
          itemCount: doctorsData.specialityDoctors.length,
          itemBuilder: (BuildContext context, int index) =>
              doctorBuilder(index, doctorsData),
        ),
      );
    });
  }
}
