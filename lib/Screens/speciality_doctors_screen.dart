import 'package:flutter/material.dart';
import 'package:clinido/models/doctor.dart';
import 'package:clinido/widgets/doctors_list.dart';

class SpecialityDoctorsScreen extends StatefulWidget {
  static String id = "speciality_doctors_screen";
  final String screenTitle;
  final List<Doctor> doctors;
  const SpecialityDoctorsScreen(
      {Key key, @required this.screenTitle, @required this.doctors})
      : super(key: key);

  @override
  _SpecialityDoctorsScreenState createState() =>
      _SpecialityDoctorsScreenState();
}

class _SpecialityDoctorsScreenState extends State<SpecialityDoctorsScreen> {
  final List<Doctor> sellectedCateg = [];

  @override
  void initState() {
    super.initState();
    initSpecialityDoctors();
  }

  initSpecialityDoctors() {
    widget.doctors.forEach((doctor) {
      if (doctor.drCategory == widget.screenTitle) {
        setState(() {
          sellectedCateg.add(doctor);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.screenTitle),
      ),
      body: DoctorsList(
        // doctors: widget.doctors,
        doctors: sellectedCateg,
      ),
    );
  }
}
