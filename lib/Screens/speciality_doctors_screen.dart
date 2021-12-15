import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clinido/providers/doctors_data.dart';
import 'package:clinido/models/doctor.dart';
import 'package:clinido/widgets/doctors_list.dart';

class SpecialityDoctorsScreen extends StatefulWidget {
  static String id = "speciality_doctors_screen";
  final String screenTitle;
  const SpecialityDoctorsScreen({Key key, @required this.screenTitle})
      : super(key: key);

  @override
  _SpecialityDoctorsScreenState createState() =>
      _SpecialityDoctorsScreenState();
}

class _SpecialityDoctorsScreenState extends State<SpecialityDoctorsScreen> {
  final List<Doctor> sellectedCateg = [];

  @override
  void initState() {
    initSpecialityDoctors();
    super.initState();
  }

  initSpecialityDoctors() {
    Provider.of<DoctorsData>(context, listen: false)
        .initSpecialityDoctors(widget.screenTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.screenTitle),
      ),
      body: DoctorsList(),
    );
  }
}
